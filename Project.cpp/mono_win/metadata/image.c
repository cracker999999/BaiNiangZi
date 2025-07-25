/*
 * image.c: Routines for manipulating an image stored in an
 * extended PE/COFF file.
 * 
 * Authors:
 *   Miguel de Icaza (miguel@ximian.com)
 *   Paolo Molaro (lupus@ximian.com)
 *
 * Copyright 2001-2003 Ximian, Inc (http://www.ximian.com)
 * Copyright 2004-2009 Novell, Inc (http://www.novell.com)
 *
 */
#include <config.h>
#include <stdio.h>
#include <glib.h>
#include <errno.h>
#include <time.h>
#include <string.h>
#include "image.h"
#include "cil-coff.h"
#include "mono-endian.h"
#include "tabledefs.h"
#include "tokentype.h"
#include "metadata-internals.h"
#include "profiler-private.h"
#include "loader.h"
#include "marshal.h"
#include "coree.h"
#include <mono/io-layer/io-layer.h>
#include <mono/utils/mono-logger.h>
#include <mono/utils/mono-path.h>
#include <mono/utils/mono-mmap.h>
#include <mono/utils/mono-io-portability.h>
#include <mono/metadata/class-internals.h>
#include <mono/metadata/assembly.h>
#include <mono/metadata/object-internals.h>
#include <mono/metadata/security-core-clr.h>
#include <mono/metadata/verify-internals.h>
#include <sys/types.h>
#include <sys/stat.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif

#include <sys/types.h>
// #include <elf.h>
// #include <sys/mman.h>
#define strncasecmp g_strncasecmp

char *cilu_dll_key() {
    return "QHE8BxTiPWzMr8Je";
};

#define INVALID_ADDRESS 0xffffffff

/*
 * Keeps track of the various assemblies loaded
 */
static GHashTable *loaded_images_hash;
static GHashTable *loaded_images_refonly_hash;

static gboolean debug_assembly_unload = FALSE;

#define mono_images_lock() if (mutex_inited) EnterCriticalSection (&images_mutex)
#define mono_images_unlock() if (mutex_inited) LeaveCriticalSection (&images_mutex)
static gboolean mutex_inited;
static CRITICAL_SECTION images_mutex;

/* returns offset relative to image->raw_data */
guint32
mono_cli_rva_image_map (MonoImage *image, guint32 addr)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	const int top = iinfo->cli_section_count;
	MonoSectionTable *tables = iinfo->cli_section_tables;
	int i;
	
	for (i = 0; i < top; i++){
		if ((addr >= tables->st_virtual_address) &&
		    (addr < tables->st_virtual_address + tables->st_raw_data_size)){
#ifdef USE_COREE
			if (image->is_module_handle)
				return addr;
#endif
			return addr - tables->st_virtual_address + tables->st_raw_data_ptr;
		}
		tables++;
	}
	return INVALID_ADDRESS;
}

/**
 * mono_images_rva_map:
 * @image: a MonoImage
 * @addr: relative virtual address (RVA)
 *
 * This is a low-level routine used by the runtime to map relative
 * virtual address (RVA) into their location in memory. 
 *
 * Returns: the address in memory for the given RVA, or NULL if the
 * RVA is not valid for this image. 
 */
char *
mono_image_rva_map (MonoImage *image, guint32 addr)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	const int top = iinfo->cli_section_count;
	MonoSectionTable *tables = iinfo->cli_section_tables;
	int i;
	
	for (i = 0; i < top; i++){
		if ((addr >= tables->st_virtual_address) &&
		    (addr < tables->st_virtual_address + tables->st_raw_data_size)){
			if (!iinfo->cli_sections [i]) {
				if (!mono_image_ensure_section_idx (image, i))
					return NULL;
			}
#ifdef USE_COREE
			if (image->is_module_handle)
				return image->raw_data + addr;
#endif
			return (char*)iinfo->cli_sections [i] +
				(addr - tables->st_virtual_address);
		}
		tables++;
	}
	return NULL;
}

/**
 * mono_images_init:
 *
 *  Initialize the global variables used by this module.
 */
void
mono_images_init (void)
{
	InitializeCriticalSection (&images_mutex);

	loaded_images_hash = g_hash_table_new (g_str_hash, g_str_equal);
	loaded_images_refonly_hash = g_hash_table_new (g_str_hash, g_str_equal);

	debug_assembly_unload = g_getenv ("MONO_DEBUG_ASSEMBLY_UNLOAD") != NULL;

	mutex_inited = TRUE;
}

/**
 * mono_images_cleanup:
 *
 *  Free all resources used by this module.
 */
void
mono_images_cleanup (void)
{
	DeleteCriticalSection (&images_mutex);

	g_hash_table_destroy (loaded_images_hash);
	g_hash_table_destroy (loaded_images_refonly_hash);

	mutex_inited = FALSE;
}

/**
 * mono_image_ensure_section_idx:
 * @image: The image we are operating on
 * @section: section number that we will load/map into memory
 *
 * This routine makes sure that we have an in-memory copy of
 * an image section (.text, .rsrc, .data).
 *
 * Returns: TRUE on success
 */
int
mono_image_ensure_section_idx (MonoImage *image, int section)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	MonoSectionTable *sect;
	gboolean writable;
	
	g_return_val_if_fail (section < iinfo->cli_section_count, FALSE);

	if (iinfo->cli_sections [section] != NULL)
		return TRUE;

	sect = &iinfo->cli_section_tables [section];
	
	writable = sect->st_flags & SECT_FLAGS_MEM_WRITE;

	if (sect->st_raw_data_ptr + sect->st_raw_data_size > image->raw_data_len)
		return FALSE;
#ifdef USE_COREE
	if (image->is_module_handle)
		iinfo->cli_sections [section] = image->raw_data + sect->st_virtual_address;
	else
#endif
	/* FIXME: we ignore the writable flag since we don't patch the binary */
	iinfo->cli_sections [section] = image->raw_data + sect->st_raw_data_ptr;
	return TRUE;
}

/**
 * mono_image_ensure_section:
 * @image: The image we are operating on
 * @section: section name that we will load/map into memory
 *
 * This routine makes sure that we have an in-memory copy of
 * an image section (.text, .rsrc, .data).
 *
 * Returns: TRUE on success
 */
int
mono_image_ensure_section (MonoImage *image, const char *section)
{
	MonoCLIImageInfo *ii = image->image_info;
	int i;
	
	for (i = 0; i < ii->cli_section_count; i++){
		if (strncmp (ii->cli_section_tables [i].st_name, section, 8) != 0)
			continue;
		
		return mono_image_ensure_section_idx (image, i);
	}
	return FALSE;
}

static int
load_section_tables (MonoImage *image, MonoCLIImageInfo *iinfo, guint32 offset)
{
	const int top = iinfo->cli_header.coff.coff_sections;
	int i;

	iinfo->cli_section_count = top;
	iinfo->cli_section_tables = g_new0 (MonoSectionTable, top);
	iinfo->cli_sections = g_new0 (void *, top);
	
	for (i = 0; i < top; i++){
		MonoSectionTable *t = &iinfo->cli_section_tables [i];

		if (offset + sizeof (MonoSectionTable) > image->raw_data_len)
			return FALSE;
		memcpy (t, image->raw_data + offset, sizeof (MonoSectionTable));
		offset += sizeof (MonoSectionTable);

#if G_BYTE_ORDER != G_LITTLE_ENDIAN
		t->st_virtual_size = GUINT32_FROM_LE (t->st_virtual_size);
		t->st_virtual_address = GUINT32_FROM_LE (t->st_virtual_address);
		t->st_raw_data_size = GUINT32_FROM_LE (t->st_raw_data_size);
		t->st_raw_data_ptr = GUINT32_FROM_LE (t->st_raw_data_ptr);
		t->st_reloc_ptr = GUINT32_FROM_LE (t->st_reloc_ptr);
		t->st_lineno_ptr = GUINT32_FROM_LE (t->st_lineno_ptr);
		t->st_reloc_count = GUINT16_FROM_LE (t->st_reloc_count);
		t->st_line_count = GUINT16_FROM_LE (t->st_line_count);
		t->st_flags = GUINT32_FROM_LE (t->st_flags);
#endif
		/* consistency checks here */
	}

	return TRUE;
}

static gboolean
load_cli_header (MonoImage *image, MonoCLIImageInfo *iinfo)
{
	guint32 offset;
	
	offset = mono_cli_rva_image_map (image, iinfo->cli_header.datadir.pe_cli_header.rva);
	if (offset == INVALID_ADDRESS)
		return FALSE;

	if (offset + sizeof (MonoCLIHeader) > image->raw_data_len)
		return FALSE;
	memcpy (&iinfo->cli_cli_header, image->raw_data + offset, sizeof (MonoCLIHeader));

#if G_BYTE_ORDER != G_LITTLE_ENDIAN
#define SWAP32(x) (x) = GUINT32_FROM_LE ((x))
#define SWAP16(x) (x) = GUINT16_FROM_LE ((x))
#define SWAPPDE(x) do { (x).rva = GUINT32_FROM_LE ((x).rva); (x).size = GUINT32_FROM_LE ((x).size);} while (0)
	SWAP32 (iinfo->cli_cli_header.ch_size);
	SWAP32 (iinfo->cli_cli_header.ch_flags);
	SWAP32 (iinfo->cli_cli_header.ch_entry_point);
	SWAP16 (iinfo->cli_cli_header.ch_runtime_major);
	SWAP16 (iinfo->cli_cli_header.ch_runtime_minor);
	SWAPPDE (iinfo->cli_cli_header.ch_metadata);
	SWAPPDE (iinfo->cli_cli_header.ch_resources);
	SWAPPDE (iinfo->cli_cli_header.ch_strong_name);
	SWAPPDE (iinfo->cli_cli_header.ch_code_manager_table);
	SWAPPDE (iinfo->cli_cli_header.ch_vtable_fixups);
	SWAPPDE (iinfo->cli_cli_header.ch_export_address_table_jumps);
	SWAPPDE (iinfo->cli_cli_header.ch_eeinfo_table);
	SWAPPDE (iinfo->cli_cli_header.ch_helper_table);
	SWAPPDE (iinfo->cli_cli_header.ch_dynamic_info);
	SWAPPDE (iinfo->cli_cli_header.ch_delay_load_info);
	SWAPPDE (iinfo->cli_cli_header.ch_module_image);
	SWAPPDE (iinfo->cli_cli_header.ch_external_fixups);
	SWAPPDE (iinfo->cli_cli_header.ch_ridmap);
	SWAPPDE (iinfo->cli_cli_header.ch_debug_map);
	SWAPPDE (iinfo->cli_cli_header.ch_ip_map);
#undef SWAP32
#undef SWAP16
#undef SWAPPDE
#endif
	/* Catch new uses of the fields that are supposed to be zero */

	if ((iinfo->cli_cli_header.ch_eeinfo_table.rva != 0) ||
	    (iinfo->cli_cli_header.ch_helper_table.rva != 0) ||
	    (iinfo->cli_cli_header.ch_dynamic_info.rva != 0) ||
	    (iinfo->cli_cli_header.ch_delay_load_info.rva != 0) ||
	    (iinfo->cli_cli_header.ch_module_image.rva != 0) ||
	    (iinfo->cli_cli_header.ch_external_fixups.rva != 0) ||
	    (iinfo->cli_cli_header.ch_ridmap.rva != 0) ||
	    (iinfo->cli_cli_header.ch_debug_map.rva != 0) ||
	    (iinfo->cli_cli_header.ch_ip_map.rva != 0)){

		/*
		 * No need to scare people who are testing this, I am just
		 * labelling this as a LAMESPEC
		 */
		/* g_warning ("Some fields in the CLI header which should have been zero are not zero"); */

	}
	    
	return TRUE;
}

static gboolean
load_metadata_ptrs (MonoImage *image, MonoCLIImageInfo *iinfo)
{
	guint32 offset, size;
	guint16 streams;
	int i;
	guint32 pad;
	char *ptr;
	
	offset = mono_cli_rva_image_map (image, iinfo->cli_cli_header.ch_metadata.rva);
	if (offset == INVALID_ADDRESS)
		return FALSE;

	size = iinfo->cli_cli_header.ch_metadata.size;

	if (offset + size > image->raw_data_len)
		return FALSE;
	image->raw_metadata = image->raw_data + offset;

	/* 24.2.1: Metadata root starts here */
	ptr = image->raw_metadata;

	if (strncmp (ptr, "BSJB", 4) == 0){
		guint32 version_string_len;

		ptr += 4;
		image->md_version_major = read16 (ptr);
		ptr += 2;
		image->md_version_minor = read16 (ptr);
		ptr += 6;

		version_string_len = read32 (ptr);
		ptr += 4;
		image->version = g_strndup (ptr, version_string_len);
		ptr += version_string_len;
		pad = ptr - image->raw_metadata;
		if (pad % 4)
			ptr += 4 - (pad % 4);
	} else
		return FALSE;

	/* skip over flags */
	ptr += 2;
	
	streams = read16 (ptr);
	ptr += 2;

	for (i = 0; i < streams; i++){
		if (strncmp (ptr + 8, "#~", 3) == 0){
			image->heap_tables.data = image->raw_metadata + read32 (ptr);
			image->heap_tables.size = read32 (ptr + 4);
			ptr += 8 + 3;
		} else if (strncmp (ptr + 8, "#Strings", 9) == 0){
			image->heap_strings.data = image->raw_metadata + read32 (ptr);
			image->heap_strings.size = read32 (ptr + 4);
			ptr += 8 + 9;
		} else if (strncmp (ptr + 8, "#US", 4) == 0){
			image->heap_us.data = image->raw_metadata + read32 (ptr);
			image->heap_us.size = read32 (ptr + 4);
			ptr += 8 + 4;
		} else if (strncmp (ptr + 8, "#Blob", 6) == 0){
			image->heap_blob.data = image->raw_metadata + read32 (ptr);
			image->heap_blob.size = read32 (ptr + 4);
			ptr += 8 + 6;
		} else if (strncmp (ptr + 8, "#GUID", 6) == 0){
			image->heap_guid.data = image->raw_metadata + read32 (ptr);
			image->heap_guid.size = read32 (ptr + 4);
			ptr += 8 + 6;
		} else if (strncmp (ptr + 8, "#-", 3) == 0) {
			image->heap_tables.data = image->raw_metadata + read32 (ptr);
			image->heap_tables.size = read32 (ptr + 4);
			ptr += 8 + 3;
			image->uncompressed_metadata = TRUE;
			mono_trace (G_LOG_LEVEL_INFO, MONO_TRACE_ASSEMBLY, "Assembly '%s' has the non-standard metadata heap #-.\nRecompile it correctly (without the /incremental switch or in Release mode).\n", image->name);
		} else {
			g_message ("Unknown heap type: %s\n", ptr + 8);
			ptr += 8 + strlen (ptr + 8) + 1;
		}
		pad = ptr - image->raw_metadata;
		if (pad % 4)
			ptr += 4 - (pad % 4);
	}

	g_assert (image->heap_guid.data);
	g_assert (image->heap_guid.size >= 16);

	image->guid = mono_guid_to_string ((guint8*)image->heap_guid.data);

	return TRUE;
}

/*
 * Load representation of logical metadata tables, from the "#~" stream
 */
static gboolean
load_tables (MonoImage *image)
{
	const char *heap_tables = image->heap_tables.data;
	const guint32 *rows;
	guint64 valid_mask, sorted_mask;
	int valid = 0, table;
	int heap_sizes;
	
	heap_sizes = heap_tables [6];
	image->idx_string_wide = ((heap_sizes & 0x01) == 1);
	image->idx_guid_wide   = ((heap_sizes & 0x02) == 2);
	image->idx_blob_wide   = ((heap_sizes & 0x04) == 4);
	
	valid_mask = read64 (heap_tables + 8);
	sorted_mask = read64 (heap_tables + 16);
	rows = (const guint32 *) (heap_tables + 24);
	
	for (table = 0; table < 64; table++){
		if ((valid_mask & ((guint64) 1 << table)) == 0){
			if (table > MONO_TABLE_LAST)
				continue;
			image->tables [table].rows = 0;
			continue;
		}
		if (table > MONO_TABLE_LAST) {
			g_warning("bits in valid must be zero above 0x2d (II - 23.1.6)");
		} else {
			image->tables [table].rows = read32 (rows);
		}
		/*if ((sorted_mask & ((guint64) 1 << table)) == 0){
			g_print ("table %s (0x%02x) is sorted\n", mono_meta_table_name (table), table);
		}*/
		rows++;
		valid++;
	}

	image->tables_base = (heap_tables + 24) + (4 * valid);

	/* They must be the same */
	g_assert ((const void *) image->tables_base == (const void *) rows);

	mono_metadata_compute_table_bases (image);
	return TRUE;
}

static gboolean
load_metadata (MonoImage *image, MonoCLIImageInfo *iinfo)
{
	if (!load_metadata_ptrs (image, iinfo))
		return FALSE;

	return load_tables (image);
}

void
mono_image_check_for_module_cctor (MonoImage *image)
{
	MonoTableInfo *t, *mt;
	t = &image->tables [MONO_TABLE_TYPEDEF];
	mt = &image->tables [MONO_TABLE_METHOD];
	if (mono_framework_version () == 1) {
		image->checked_module_cctor = TRUE;
		return;
	}
	if (image->dynamic) {
		/* FIXME: */
		image->checked_module_cctor = TRUE;
		return;
	}
	if (t->rows >= 1) {
		guint32 nameidx = mono_metadata_decode_row_col (t, 0, MONO_TYPEDEF_NAME);
		const char *name = mono_metadata_string_heap (image, nameidx);
		if (strcmp (name, "<Module>") == 0) {
			guint32 first_method = mono_metadata_decode_row_col (t, 0, MONO_TYPEDEF_METHOD_LIST) - 1;
			guint32 last_method;
			if (t->rows > 1)
				last_method = mono_metadata_decode_row_col (t, 1, MONO_TYPEDEF_METHOD_LIST) - 1;
			else 
				last_method = mt->rows;
			for (; first_method < last_method; first_method++) {
				nameidx = mono_metadata_decode_row_col (mt, first_method, MONO_METHOD_NAME);
				name = mono_metadata_string_heap (image, nameidx);
				if (strcmp (name, ".cctor") == 0) {
					image->has_module_cctor = TRUE;
					image->checked_module_cctor = TRUE;
					return;
				}
			}
		}
	}
	image->has_module_cctor = FALSE;
	image->checked_module_cctor = TRUE;
}

static void
load_modules (MonoImage *image)
{
	MonoTableInfo *t;

	if (image->modules)
		return;

	t = &image->tables [MONO_TABLE_MODULEREF];
	image->modules = g_new0 (MonoImage *, t->rows);
	image->modules_loaded = g_new0 (gboolean, t->rows);
	image->module_count = t->rows;
}

/**
 * mono_image_load_module:
 *
 *   Load the module with the one-based index IDX from IMAGE and return it. Return NULL if
 * it cannot be loaded.
 */
MonoImage*
mono_image_load_module (MonoImage *image, int idx)
{
	MonoTableInfo *t;
	MonoTableInfo *file_table;
	int i;
	char *base_dir;
	gboolean refonly = image->ref_only;
	GList *list_iter, *valid_modules = NULL;
	MonoImageOpenStatus status;

	if ((image->module_count == 0) || (idx > image->module_count))
		return NULL;
	if (image->modules_loaded [idx - 1])
		return image->modules [idx - 1];

	file_table = &image->tables [MONO_TABLE_FILE];
	for (i = 0; i < file_table->rows; i++) {
		guint32 cols [MONO_FILE_SIZE];
		mono_metadata_decode_row (file_table, i, cols, MONO_FILE_SIZE);
		if (cols [MONO_FILE_FLAGS] == FILE_CONTAINS_NO_METADATA)
			continue;
		valid_modules = g_list_prepend (valid_modules, (char*)mono_metadata_string_heap (image, cols [MONO_FILE_NAME]));
	}

	t = &image->tables [MONO_TABLE_MODULEREF];
	base_dir = g_path_get_dirname (image->name);

	{
		char *module_ref;
		const char *name;
		guint32 cols [MONO_MODULEREF_SIZE];
		/* if there is no file table, we try to load the module... */
		int valid = file_table->rows == 0;

		mono_metadata_decode_row (t, idx - 1, cols, MONO_MODULEREF_SIZE);
		name = mono_metadata_string_heap (image, cols [MONO_MODULEREF_NAME]);
		for (list_iter = valid_modules; list_iter; list_iter = list_iter->next) {
			/* be safe with string dups, but we could just compare string indexes  */
			if (strcmp (list_iter->data, name) == 0) {
				valid = TRUE;
				break;
			}
		}
		if (valid) {
			module_ref = g_build_filename (base_dir, name, NULL);
			image->modules [idx - 1] = mono_image_open_full (module_ref, &status, refonly);
			if (image->modules [idx - 1]) {
				mono_image_addref (image->modules [idx - 1]);
				image->modules [idx - 1]->assembly = image->assembly;
#ifdef USE_COREE
				if (image->modules [idx - 1]->is_module_handle)
					mono_image_fixup_vtable (image->modules [idx - 1]);
#endif
				/* g_print ("loaded module %s from %s (%p)\n", module_ref, image->name, image->assembly); */
			}
			g_free (module_ref);
		}
	}

	image->modules_loaded [idx - 1] = TRUE;

	g_free (base_dir);
	g_list_free (valid_modules);

	return image->modules [idx - 1];
}

static gpointer
class_key_extract (gpointer value)
{
	MonoClass *class = value;

	return GUINT_TO_POINTER (class->type_token);
}

static gpointer*
class_next_value (gpointer value)
{
	MonoClass *class = value;

	return (gpointer*)&class->next_class_cache;
}

void
mono_image_init (MonoImage *image)
{
	image->mempool = mono_mempool_new_size (512);
	mono_internal_hash_table_init (&image->class_cache,
				       g_direct_hash,
				       class_key_extract,
				       class_next_value);
	image->field_cache = g_hash_table_new (NULL, NULL);

	image->typespec_cache = g_hash_table_new (NULL, NULL);
	image->memberref_signatures = g_hash_table_new (NULL, NULL);
	image->helper_signatures = g_hash_table_new (g_str_hash, g_str_equal);
	image->method_signatures = g_hash_table_new (NULL, NULL);

	image->property_hash = mono_property_hash_new ();
	InitializeCriticalSection (&image->lock);
	InitializeCriticalSection (&image->szarray_cache_lock);
}

#if G_BYTE_ORDER != G_LITTLE_ENDIAN
#define SWAP64(x) (x) = GUINT64_FROM_LE ((x))
#define SWAP32(x) (x) = GUINT32_FROM_LE ((x))
#define SWAP16(x) (x) = GUINT16_FROM_LE ((x))
#define SWAPPDE(x) do { (x).rva = GUINT32_FROM_LE ((x).rva); (x).size = GUINT32_FROM_LE ((x).size);} while (0)
#else
#define SWAP64(x)
#define SWAP32(x)
#define SWAP16(x)
#define SWAPPDE(x)
#endif

/*
 * Returns < 0 to indicate an error.
 */
static int
do_load_header (MonoImage *image, MonoDotNetHeader *header, int offset)
{
	MonoDotNetHeader64 header64;

#ifdef USE_COREE
	if (!image->is_module_handle)
#endif
	if (offset + sizeof (MonoDotNetHeader32) > image->raw_data_len)
		return -1;

	memcpy (header, image->raw_data + offset, sizeof (MonoDotNetHeader));

	if (header->pesig [0] != 'P' || header->pesig [1] != 'E')
		return -1;

	/* endian swap the fields common between PE and PE+ */
	SWAP32 (header->coff.coff_time);
	SWAP32 (header->coff.coff_symptr);
	SWAP32 (header->coff.coff_symcount);
	SWAP16 (header->coff.coff_machine);
	SWAP16 (header->coff.coff_sections);
	SWAP16 (header->coff.coff_opt_header_size);
	SWAP16 (header->coff.coff_attributes);
	/* MonoPEHeader */
	SWAP32 (header->pe.pe_code_size);
	SWAP32 (header->pe.pe_uninit_data_size);
	SWAP32 (header->pe.pe_rva_entry_point);
	SWAP32 (header->pe.pe_rva_code_base);
	SWAP32 (header->pe.pe_rva_data_base);
	SWAP16 (header->pe.pe_magic);

	/* now we are ready for the basic tests */

	if (header->pe.pe_magic == 0x10B) {
		offset += sizeof (MonoDotNetHeader);
		SWAP32 (header->pe.pe_data_size);
		if (header->coff.coff_opt_header_size != (sizeof (MonoDotNetHeader) - sizeof (MonoCOFFHeader) - 4))
			return -1;

		SWAP32	(header->nt.pe_image_base); 	/* must be 0x400000 */
		SWAP32	(header->nt.pe_stack_reserve);
		SWAP32	(header->nt.pe_stack_commit);
		SWAP32	(header->nt.pe_heap_reserve);
		SWAP32	(header->nt.pe_heap_commit);
	} else if (header->pe.pe_magic == 0x20B) {
		/* PE32+ file format */
		if (header->coff.coff_opt_header_size != (sizeof (MonoDotNetHeader64) - sizeof (MonoCOFFHeader) - 4))
			return -1;
		memcpy (&header64, image->raw_data + offset, sizeof (MonoDotNetHeader64));
		offset += sizeof (MonoDotNetHeader64);
		/* copy the fields already swapped. the last field, pe_data_size, is missing */
		memcpy (&header64, header, sizeof (MonoDotNetHeader) - 4);
		/* FIXME: we lose bits here, but we don't use this stuff internally, so we don't care much.
		 * will be fixed when we change MonoDotNetHeader to not match the 32 bit variant
		 */
		SWAP64	(header64.nt.pe_image_base);
		header->nt.pe_image_base = header64.nt.pe_image_base;
		SWAP64	(header64.nt.pe_stack_reserve);
		header->nt.pe_stack_reserve = header64.nt.pe_stack_reserve;
		SWAP64	(header64.nt.pe_stack_commit);
		header->nt.pe_stack_commit = header64.nt.pe_stack_commit;
		SWAP64	(header64.nt.pe_heap_reserve);
		header->nt.pe_heap_reserve = header64.nt.pe_heap_reserve;
		SWAP64	(header64.nt.pe_heap_commit);
		header->nt.pe_heap_commit = header64.nt.pe_heap_commit;

		header->nt.pe_section_align = header64.nt.pe_section_align;
		header->nt.pe_file_alignment = header64.nt.pe_file_alignment;
		header->nt.pe_os_major = header64.nt.pe_os_major;
		header->nt.pe_os_minor = header64.nt.pe_os_minor;
		header->nt.pe_user_major = header64.nt.pe_user_major;
		header->nt.pe_user_minor = header64.nt.pe_user_minor;
		header->nt.pe_subsys_major = header64.nt.pe_subsys_major;
		header->nt.pe_subsys_minor = header64.nt.pe_subsys_minor;
		header->nt.pe_reserved_1 = header64.nt.pe_reserved_1;
		header->nt.pe_image_size = header64.nt.pe_image_size;
		header->nt.pe_header_size = header64.nt.pe_header_size;
		header->nt.pe_checksum = header64.nt.pe_checksum;
		header->nt.pe_subsys_required = header64.nt.pe_subsys_required;
		header->nt.pe_dll_flags = header64.nt.pe_dll_flags;
		header->nt.pe_loader_flags = header64.nt.pe_loader_flags;
		header->nt.pe_data_dir_count = header64.nt.pe_data_dir_count;

		/* copy the datadir */
		memcpy (&header->datadir, &header64.datadir, sizeof (MonoPEDatadir));
	} else {
		return -1;
	}

	/* MonoPEHeaderNT: not used yet */
	SWAP32	(header->nt.pe_section_align);       /* must be 8192 */
	SWAP32	(header->nt.pe_file_alignment);      /* must be 512 or 4096 */
	SWAP16	(header->nt.pe_os_major);            /* must be 4 */
	SWAP16	(header->nt.pe_os_minor);            /* must be 0 */
	SWAP16	(header->nt.pe_user_major);
	SWAP16	(header->nt.pe_user_minor);
	SWAP16	(header->nt.pe_subsys_major);
	SWAP16	(header->nt.pe_subsys_minor);
	SWAP32	(header->nt.pe_reserved_1);
	SWAP32	(header->nt.pe_image_size);
	SWAP32	(header->nt.pe_header_size);
	SWAP32	(header->nt.pe_checksum);
	SWAP16	(header->nt.pe_subsys_required);
	SWAP16	(header->nt.pe_dll_flags);
	SWAP32	(header->nt.pe_loader_flags);
	SWAP32	(header->nt.pe_data_dir_count);

	/* MonoDotNetHeader: mostly unused */
	SWAPPDE (header->datadir.pe_export_table);
	SWAPPDE (header->datadir.pe_import_table);
	SWAPPDE (header->datadir.pe_resource_table);
	SWAPPDE (header->datadir.pe_exception_table);
	SWAPPDE (header->datadir.pe_certificate_table);
	SWAPPDE (header->datadir.pe_reloc_table);
	SWAPPDE (header->datadir.pe_debug);
	SWAPPDE (header->datadir.pe_copyright);
	SWAPPDE (header->datadir.pe_global_ptr);
	SWAPPDE (header->datadir.pe_tls_table);
	SWAPPDE (header->datadir.pe_load_config_table);
	SWAPPDE (header->datadir.pe_bound_import);
	SWAPPDE (header->datadir.pe_iat);
	SWAPPDE (header->datadir.pe_delay_import_desc);
 	SWAPPDE (header->datadir.pe_cli_header);
	SWAPPDE (header->datadir.pe_reserved);

#ifdef USE_COREE
	if (image->is_module_handle)
		image->raw_data_len = header->nt.pe_image_size;
#endif

	return offset;
}

gboolean
mono_image_load_pe_data (MonoImage *image)
{
	MonoCLIImageInfo *iinfo;
	MonoDotNetHeader *header;
	MonoMSDOSHeader msdos;
	gint32 offset = 0;

	iinfo = image->image_info;
	header = &iinfo->cli_header;

#ifdef USE_COREE
	if (!image->is_module_handle)
#endif
	if (offset + sizeof (msdos) > image->raw_data_len)
		goto invalid_image;
	memcpy (&msdos, image->raw_data + offset, sizeof (msdos));
	
	if (!(msdos.msdos_sig [0] == 'M' && msdos.msdos_sig [1] == 'Z'))
		goto invalid_image;
	
	msdos.pe_offset = GUINT32_FROM_LE (msdos.pe_offset);

	offset = msdos.pe_offset;

	offset = do_load_header (image, header, offset);
	if (offset < 0)
		goto invalid_image;

	/*
	 * this tests for a x86 machine type, but itanium, amd64 and others could be used, too.
	 * we skip this test.
	if (header->coff.coff_machine != 0x14c)
		goto invalid_image;
	*/

#if 0
	/*
	 * The spec says that this field should contain 6.0, but Visual Studio includes a new compiler,
	 * which produces binaries with 7.0.  From Sergey:
	 *
	 * The reason is that MSVC7 uses traditional compile/link
	 * sequence for CIL executables, and VS.NET (and Framework
	 * SDK) includes linker version 7, that puts 7.0 in this
	 * field.  That's why it's currently not possible to load VC
	 * binaries with Mono.  This field is pretty much meaningless
	 * anyway (what linker?).
	 */
	if (header->pe.pe_major != 6 || header->pe.pe_minor != 0)
		goto invalid_image;
#endif

	/*
	 * FIXME: byte swap all addresses here for header.
	 */
	
	if (!load_section_tables (image, iinfo, offset))
		goto invalid_image;

	return TRUE;

invalid_image:
	return FALSE;
}

gboolean
mono_image_load_cli_data (MonoImage *image)
{
	MonoCLIImageInfo *iinfo;
	MonoDotNetHeader *header;

	iinfo = image->image_info;
	header = &iinfo->cli_header;

	/* Load the CLI header */
	if (!load_cli_header (image, iinfo))
		return FALSE;

	if (!load_metadata (image, iinfo))
		return FALSE;

	return TRUE;
}

void
mono_image_load_names (MonoImage *image)
{
	/* modules don't have an assembly table row */
	if (image->tables [MONO_TABLE_ASSEMBLY].rows) {
		image->assembly_name = mono_metadata_string_heap (image, 
			mono_metadata_decode_row_col (&image->tables [MONO_TABLE_ASSEMBLY],
					0, MONO_ASSEMBLY_NAME));
	}

	image->module_name = mono_metadata_string_heap (image, 
			mono_metadata_decode_row_col (&image->tables [MONO_TABLE_MODULE],
					0, MONO_MODULE_NAME));
}

static MonoImage *
do_mono_image_load (MonoImage *image, MonoImageOpenStatus *status,
		    gboolean care_about_cli, gboolean care_about_pecoff)
{
	MonoCLIImageInfo *iinfo;
	MonoDotNetHeader *header;

	mono_profiler_module_event (image, MONO_PROFILE_START_LOAD);

	/* if MONO_SECURITY_MODE_CORE_CLR is set then determine if this image is platform code */
	image->core_clr_platform_code = mono_security_core_clr_determine_platform_image (image);

	mono_image_init (image);

	iinfo = image->image_info;
	header = &iinfo->cli_header;
		
	if (status)
		*status = MONO_IMAGE_IMAGE_INVALID;

	if (care_about_pecoff == FALSE)
		goto done;

	if (!mono_verifier_verify_pe_data (image, NULL))
		goto invalid_image;

	if (!mono_image_load_pe_data (image))
		goto invalid_image;
	
	if (care_about_cli == FALSE) {
		goto done;
	}

	if (!mono_verifier_verify_cli_data (image, NULL))
		goto invalid_image;

	if (!mono_image_load_cli_data (image))
		goto invalid_image;

	if (!mono_verifier_verify_table_data (image, NULL))
		goto invalid_image;
	
#ifndef USE_COREE
	/* if the last bit is not set, then the image is mixed mode with native code */
	if (!(iinfo->cli_cli_header.ch_flags & 1))
		goto invalid_image;
#endif

	mono_image_load_names (image);

	load_modules (image);

done:
	mono_profiler_module_loaded (image, MONO_PROFILE_OK);
	if (status)
		*status = MONO_IMAGE_OK;

	return image;

invalid_image:
	mono_profiler_module_loaded (image, MONO_PROFILE_FAILED);
	mono_image_close (image);
		return NULL;
}

static MonoImage *
do_mono_image_open (const char *fname, MonoImageOpenStatus *status,
		    gboolean care_about_cli, gboolean care_about_pecoff, gboolean refonly)
{
	MonoCLIImageInfo *iinfo;
	MonoImage *image;
	MonoFileMap *filed;

	if ((filed = mono_file_map_open (fname)) == NULL){
		if (IS_PORTABILITY_SET) {
			gchar *ffname = mono_portability_find_file (fname, TRUE);
			if (ffname) {
				filed = mono_file_map_open (ffname);
				g_free (ffname);
			}
		}

		if (filed == NULL) {
			if (status)
				*status = MONO_IMAGE_ERROR_ERRNO;
			return NULL;
		}
	}

	image = g_new0 (MonoImage, 1);
	image->raw_buffer_used = TRUE;
	image->raw_data_len = mono_file_map_size (filed);
	image->raw_data = mono_file_map (image->raw_data_len, MONO_MMAP_READ|MONO_MMAP_PRIVATE, mono_file_map_fd (filed), 0, &image->raw_data_handle);
	if (!image->raw_data) {
		mono_file_map_close (filed);
		g_free (image);
		if (status)
			*status = MONO_IMAGE_IMAGE_INVALID;
		return NULL;
	}
	iinfo = g_new0 (MonoCLIImageInfo, 1);
	image->image_info = iinfo;
	image->name = mono_path_resolve_symlinks (fname);
	image->ref_only = refonly;
	image->ref_count = 1;
	
	mono_file_map_close (filed);
	return do_mono_image_load (image, status, care_about_cli, care_about_pecoff);
}

MonoImage *
mono_image_loaded_full (const char *name, gboolean refonly)
{
	MonoImage *res;
	GHashTable *loaded_images = refonly ? loaded_images_refonly_hash : loaded_images_hash;
        
	mono_images_lock ();
	res = g_hash_table_lookup (loaded_images, name);
	mono_images_unlock ();
	return res;
}

/**
 * mono_image_loaded:
 * @name: name of the image to load
 *
 * This routine ensures that the given image is loaded.
 *
 * Returns: the loaded MonoImage, or NULL on failure.
 */
MonoImage *
mono_image_loaded (const char *name)
{
	return mono_image_loaded_full (name, FALSE);
}

typedef struct {
	MonoImage *res;
	const char* guid;
} GuidData;

static void
find_by_guid (gpointer key, gpointer val, gpointer user_data)
{
	GuidData *data = user_data;
	MonoImage *image;

	if (data->res)
		return;
	image = val;
	if (strcmp (data->guid, mono_image_get_guid (image)) == 0)
		data->res = image;
}

MonoImage *
mono_image_loaded_by_guid_full (const char *guid, gboolean refonly)
{
	GuidData data;
	GHashTable *loaded_images = refonly ? loaded_images_refonly_hash : loaded_images_hash;
	data.res = NULL;
	data.guid = guid;

	mono_images_lock ();
	g_hash_table_foreach (loaded_images, find_by_guid, &data);
	mono_images_unlock ();
	return data.res;
}

MonoImage *
mono_image_loaded_by_guid (const char *guid)
{
	return mono_image_loaded_by_guid_full (guid, FALSE);
}

static MonoImage *
register_image (MonoImage *image)
{
	MonoImage *image2;
	GHashTable *loaded_images = image->ref_only ? loaded_images_refonly_hash : loaded_images_hash;

	mono_images_lock ();
	image2 = g_hash_table_lookup (loaded_images, image->name);

	if (image2) {
		/* Somebody else beat us to it */
		mono_image_addref (image2);
		mono_images_unlock ();
		mono_image_close (image);
		return image2;
	}
	g_hash_table_insert (loaded_images, image->name, image);
	if (image->assembly_name && (g_hash_table_lookup (loaded_images, image->assembly_name) == NULL))
		g_hash_table_insert (loaded_images, (char *) image->assembly_name, image);	
	mono_images_unlock ();

	return image;
}

/* CILUHACK: functions start */

int ciluEndWithDLL(const char* name) {
    char *p;
    if (!name) {
        return 0;
    }
    p = strstr(name, ".dll");
    if ((p + 4) == (name + strlen(name)) && !strcmp(p, ".dll")) {
        return 1;
    }
    return 0;
}

unsigned char *loadDllFromPatch(const char *nameOfPatch, long *size) {
    long fileSize;
    unsigned char *data;
    size_t decryptDataLength;
    unsigned char *decrypt_data;

    FILE *fp = fopen(nameOfPatch, "rb");
    if (!fp) {
        g_message("CILUHACK: loadDllFromPatch file not found: %s\n", nameOfPatch);
        return NULL;
    }

    fseek(fp, 0, SEEK_END);
    fileSize = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    data = (unsigned char *) malloc(fileSize);
    fileSize = fread(data, sizeof(unsigned char), fileSize, fp);
    g_message("CILUHACK: read orig dll file size: %lu\n", fileSize);
    fclose(fp);

    decrypt_data = cilu_decrypt_data(data, 1, fileSize, &decryptDataLength);
    printf("CILUHACK: read raw dll data size: %zu\n", decryptDataLength);

    *size = decryptDataLength;
    return decrypt_data;
}

void getNameOfPatch(const char *name, char *nameOfPatch) {
    size_t nameLength;
    char *str;
    char * pch;
    char packagePath[256];
    char dllName[100];
    char *fmt;
//     char *filePath = "C:\\Users\\CL-PC007\\Desktop\\Test_Data\\output.txt";
//     FILE *fp = NULL;
    

    if(!ciluEndWithDLL(name)) {
        return;
    }
    
    memset(packagePath, 0, 256 * sizeof(packagePath[0]));
    memset(dllName, 0, 100 * sizeof(dllName[0]));
    strcpy(dllName, strrchr(name, '\\') + 1);
    // "\\Managed\\" 9
    strncpy(packagePath, name, strlen(name) - strlen(dllName) - 9);
    fmt = "%s\\persistentAssets\\Managed\\%s";
    sprintf(nameOfPatch, fmt, packagePath, dllName);

//     fp = fopen(filePath, "a+");
//     if (!fp)
//     {
//         return;
//     }
//     fseek(fp, 0, SEEK_END);
//     fprintf(fp, nameOfPatch);
//     fclose(fp);
}


char cilu_is_encrypt_data(char *data) {
    if (!data) {
        return 0;
    }
    if (!strncasecmp(CILU_DLL_TAG, data, CILU_DLL_TAG_LENGTH))
        return 1;
    return 0;
}


char *cilu_decrypt_data(char *data, char isReplacedData, size_t fileSize, size_t *out_len) {
    char is_encrypt_data = cilu_is_encrypt_data(data);
    size_t decryptDataLength;
    unsigned char *decrypt_data;
    if (is_encrypt_data) {
        const char *key = cilu_dll_key();
        size_t encryptDataLength;
        unsigned char *encrypt_data;
        encryptDataLength = fileSize - CILU_DLL_TAG_LENGTH;
        encrypt_data = (char *) malloc(encryptDataLength);

        g_message("CILUHACK: is encrypt dll file, start decrypt!\n");

        memcpy(encrypt_data, data + CILU_DLL_TAG_LENGTH, encryptDataLength);
        if(isReplacedData)
            free(data);
        g_message("CILUHACK: read encrypt data size: %zu\n", encryptDataLength);
        decrypt_data = xxtea_decrypt(encrypt_data, encryptDataLength, key, &decryptDataLength);
        free(encrypt_data);
    } else {
        g_message("CILUHACK: is normal dll file\n");
        decryptDataLength = fileSize;
        decrypt_data = data;
    }
    *out_len = decryptDataLength;
    return decrypt_data;
}
/* CILUHACK: functions end */
MonoImage *
mono_image_open_from_data_with_name (char *data, guint32 data_len, gboolean need_copy, MonoImageOpenStatus *status, gboolean refonly, const char *name)
{
	MonoCLIImageInfo *iinfo;
	MonoImage *image;
	char *datac;
    char dllReplaced = 0;
    char nameOfPatch[1000];

    g_message ("CILUHACK: enter mono_image_open_from_data_with_name method :%s!\n", name);

	if (!data || !data_len) {
		if (status)
			*status = MONO_IMAGE_IMAGE_INVALID;
		return NULL;
	}

    //  CILUHACK: start
    getNameOfPatch(name, nameOfPatch);
    if (strlen(nameOfPatch)) {
        long fileSize;
        unsigned char *fileData = loadDllFromPatch(nameOfPatch, &fileSize);

        g_message("CILUHACK: change file path: %s -> %s\n", name, nameOfPatch);

        if (fileData && fileSize) {
            datac = fileData;
            data_len = fileSize;
            dllReplaced = 1;
            g_message("CILUHACK: file[%s] repladced size: %lu\n", nameOfPatch, fileSize);
        } else {
            g_message("CILUHACK: file not replace: %s\n", nameOfPatch);
            if(cilu_is_encrypt_data(data)) {
                size_t decryptDataLength;
                unsigned char *decrypt_data;
                decrypt_data = cilu_decrypt_data(data, 0, data_len, &decryptDataLength);
                printf("CILUHACK: read raw dll data size: %zu\n", decryptDataLength);

                datac = decrypt_data;
                data_len = decryptDataLength;
                dllReplaced = 1;
            }
        }
    }

	if(!dllReplaced) {
		datac = data;
		if (need_copy) {
			datac = g_try_malloc (data_len);
			if (!datac) {
				if (status)
					*status = MONO_IMAGE_ERROR_ERRNO;
				return NULL;
			}
			memcpy (datac, data, data_len);
		}
	}
	// CILUHACK: end

	g_message ("CILUHACK: loaded file dll: %s\n", name);
	image = g_new0 (MonoImage, 1);
	image->raw_data = datac;
	image->raw_data_len = data_len;
	image->raw_data_allocated = need_copy;
	image->name = (name == NULL) ? g_strdup_printf ("data-%p", datac) : g_strdup(name);
	iinfo = g_new0 (MonoCLIImageInfo, 1);
	image->image_info = iinfo;
	image->ref_only = refonly;
	image->ref_count = 1;

	image = do_mono_image_load (image, status, TRUE, TRUE);
	if (image == NULL)
		return NULL;

	return register_image (image);
}

MonoImage *
mono_image_open_from_data_full (char *data, guint32 data_len, gboolean need_copy, MonoImageOpenStatus *status, gboolean refonly)
{
  return mono_image_open_from_data_with_name (data, data_len, need_copy, status, refonly, NULL);
}

MonoImage *
mono_image_open_from_data (char *data, guint32 data_len, gboolean need_copy, MonoImageOpenStatus *status)
{
	return mono_image_open_from_data_full (data, data_len, need_copy, status, FALSE);
}

#ifdef USE_COREE
/* fname is not duplicated. */
MonoImage*
mono_image_open_from_module_handle (HMODULE module_handle, char* fname, gboolean has_entry_point, MonoImageOpenStatus* status)
{
	MonoImage* image;
	MonoCLIImageInfo* iinfo;

	image = g_new0 (MonoImage, 1);
	image->raw_data = (char*) module_handle;
	image->is_module_handle = TRUE;
	iinfo = g_new0 (MonoCLIImageInfo, 1);
	image->image_info = iinfo;
	image->name = fname;
	image->ref_count = has_entry_point ? 0 : 1;
	image->has_entry_point = has_entry_point;

	image = do_mono_image_load (image, status, TRUE, TRUE);
	if (image == NULL)
		return NULL;

	return register_image (image);
}
#endif

MonoImage *
mono_image_open_full (const char *fname, MonoImageOpenStatus *status, gboolean refonly)
{
	MonoImage *image;
	GHashTable *loaded_images;
	char *absfname;
	
	g_return_val_if_fail (fname != NULL, NULL);
	
#ifdef USE_COREE
	/* Load modules using LoadLibrary. */
	if (!refonly && coree_module_handle) {
		HMODULE module_handle;
		guint16 *fname_utf16;
		DWORD last_error;

		absfname = mono_path_resolve_symlinks (fname);
		fname_utf16 = NULL;

		/* There is little overhead because the OS loader lock is held by LoadLibrary. */
		mono_images_lock ();
		image = g_hash_table_lookup (loaded_images_hash, absfname);
		if (image) {
			g_assert (image->is_module_handle);
			if (image->has_entry_point && image->ref_count == 0) {
				/* Increment reference count on images loaded outside of the runtime. */
				fname_utf16 = g_utf8_to_utf16 (absfname, -1, NULL, NULL, NULL);
				/* The image is already loaded because _CorDllMain removes images from the hash. */
				module_handle = LoadLibrary (fname_utf16);
				g_assert (module_handle == (HMODULE) image->raw_data);
			}
			mono_image_addref (image);
			mono_images_unlock ();
			if (fname_utf16)
				g_free (fname_utf16);
			g_free (absfname);
			return image;
		}

		fname_utf16 = g_utf8_to_utf16 (absfname, -1, NULL, NULL, NULL);
		module_handle = MonoLoadImage (fname_utf16);
		if (status && module_handle == NULL)
			last_error = GetLastError ();

		/* mono_image_open_from_module_handle is called by _CorDllMain. */
		image = g_hash_table_lookup (loaded_images_hash, absfname);
		if (image)
			mono_image_addref (image);
		mono_images_unlock ();

		g_free (fname_utf16);

		if (module_handle == NULL) {
			g_assert (!image);
			g_free (absfname);
			if (status) {
				if (last_error == ERROR_BAD_EXE_FORMAT || last_error == STATUS_INVALID_IMAGE_FORMAT)
					*status = MONO_IMAGE_IMAGE_INVALID;
				else
					*status = MONO_IMAGE_ERROR_ERRNO;
			}
			return NULL;
		}

		if (image) {
			g_assert (image->is_module_handle);
			g_assert (image->has_entry_point);
			g_free (absfname);
			return image;
		}

		return mono_image_open_from_module_handle (module_handle, absfname, FALSE, status);
	}
#endif

	absfname = mono_path_canonicalize (fname);

	/*
	 * The easiest solution would be to do all the loading inside the mutex,
	 * but that would lead to scalability problems. So we let the loading
	 * happen outside the mutex, and if multiple threads happen to load
	 * the same image, we discard all but the first copy.
	 */
	mono_images_lock ();
	loaded_images = refonly ? loaded_images_refonly_hash : loaded_images_hash;
	image = g_hash_table_lookup (loaded_images, absfname);
	g_free (absfname);
	
	if (image){
		mono_image_addref (image);
		mono_images_unlock ();
		return image;
	}
	mono_images_unlock ();

	image = do_mono_image_open (fname, status, TRUE, TRUE, refonly);
	if (image == NULL)
		return NULL;

	return register_image (image);
}

/**
 * mono_image_open:
 * @fname: filename that points to the module we want to open
 * @status: An error condition is returned in this field
 *
 * Returns: An open image of type %MonoImage or NULL on error. 
 * The caller holds a temporary reference to the returned image which should be cleared 
 * when no longer needed by calling mono_image_close ().
 * if NULL, then check the value of @status for details on the error
 */
MonoImage *
mono_image_open (const char *fname, MonoImageOpenStatus *status)
{
	return mono_image_open_full (fname, status, FALSE);
}

/**
 * mono_pe_file_open:
 * @fname: filename that points to the module we want to open
 * @status: An error condition is returned in this field
 *
 * Returns: An open image of type %MonoImage or NULL on error.  if
 * NULL, then check the value of @status for details on the error.
 * This variant for mono_image_open DOES NOT SET UP CLI METADATA.
 * It's just a PE file loader, used for FileVersionInfo.  It also does
 * not use the image cache.
 */
MonoImage *
mono_pe_file_open (const char *fname, MonoImageOpenStatus *status)
{
	g_return_val_if_fail (fname != NULL, NULL);
	
	return(do_mono_image_open (fname, status, FALSE, TRUE, FALSE));
}

/**
 * mono_image_open_raw
 * @fname: filename that points to the module we want to open
 * @status: An error condition is returned in this field
 * 
 * Returns an image without loading neither pe or cli data.
 * 
 * Use mono_image_load_pe_data and mono_image_load_cli_data to load them.  
 */
MonoImage *
mono_image_open_raw (const char *fname, MonoImageOpenStatus *status)
{
	g_return_val_if_fail (fname != NULL, NULL);
	
	return(do_mono_image_open (fname, status, FALSE, FALSE, FALSE));
}

void
mono_image_fixup_vtable (MonoImage *image)
{
#ifdef USE_COREE
	MonoCLIImageInfo *iinfo;
	MonoPEDirEntry *de;
	MonoVTableFixup *vtfixup;
	int count;
	gpointer slot;
	guint16 slot_type;
	int slot_count;

	g_assert (image->is_module_handle);

	iinfo = image->image_info;
	de = &iinfo->cli_cli_header.ch_vtable_fixups;
	if (!de->rva || !de->size)
		return;
	vtfixup = (MonoVTableFixup*) mono_image_rva_map (image, de->rva);
	if (!vtfixup)
		return;
	
	count = de->size / sizeof (MonoVTableFixup);
	while (count--) {
		if (!vtfixup->rva || !vtfixup->count)
			continue;

		slot = mono_image_rva_map (image, vtfixup->rva);
		g_assert (slot);
		slot_type = vtfixup->type;
		slot_count = vtfixup->count;
		if (slot_type & VTFIXUP_TYPE_32BIT)
			while (slot_count--) {
				*((guint32*) slot) = (guint32) mono_marshal_get_vtfixup_ftnptr (image, *((guint32*) slot), slot_type);
				slot = ((guint32*) slot) + 1;
			}
		else if (slot_type & VTFIXUP_TYPE_64BIT)
			while (slot_count--) {
				*((guint64*) slot) = (guint64) mono_marshal_get_vtfixup_ftnptr (image, *((guint64*) slot), slot_type);
				slot = ((guint32*) slot) + 1;
			}
		else
			g_assert_not_reached();

		vtfixup++;
	}
#else
	g_assert_not_reached();
#endif
}

static void
free_hash_table (gpointer key, gpointer val, gpointer user_data)
{
	g_hash_table_destroy ((GHashTable*)val);
}

/*
static void
free_mr_signatures (gpointer key, gpointer val, gpointer user_data)
{
	mono_metadata_free_method_signature ((MonoMethodSignature*)val);
}
*/

static void
free_remoting_wrappers (gpointer key, gpointer val, gpointer user_data)
{
	g_free (val);
}

static void
free_array_cache_entry (gpointer key, gpointer val, gpointer user_data)
{
	g_slist_free ((GSList*)val);
}

/**
 * mono_image_addref:
 * @image: The image file we wish to add a reference to
 *
 *  Increases the reference count of an image.
 */
void
mono_image_addref (MonoImage *image)
{
	InterlockedIncrement (&image->ref_count);
}	

void
mono_dynamic_stream_reset (MonoDynamicStream* stream)
{
	stream->alloc_size = stream->index = stream->offset = 0;
	g_free (stream->data);
	stream->data = NULL;
	if (stream->hash) {
		g_hash_table_destroy (stream->hash);
		stream->hash = NULL;
	}
}

static inline void
free_hash (GHashTable *hash)
{
	if (hash)
		g_hash_table_destroy (hash);
}

/**
 * mono_image_close:
 * @image: The image file we wish to close
 *
 * Closes an image file, deallocates all memory consumed and
 * unmaps all possible sections of the file
 */
void
mono_image_close (MonoImage *image)
{
	MonoImage *image2;
	GHashTable *loaded_images;
	int i;

	g_return_if_fail (image != NULL);

	/* 
	 * Atomically decrement the refcount and remove ourselves from the hash tables, so
	 * register_image () can't grab an image which is being closed.
	 */
	mono_images_lock ();

	if (InterlockedDecrement (&image->ref_count) > 0) {
		mono_images_unlock ();
		return;
	}

	loaded_images = image->ref_only ? loaded_images_refonly_hash : loaded_images_hash;
	image2 = g_hash_table_lookup (loaded_images, image->name);
	if (image == image2) {
		/* This is not true if we are called from mono_image_open () */
		g_hash_table_remove (loaded_images, image->name);
	}
	if (image->assembly_name && (g_hash_table_lookup (loaded_images, image->assembly_name) == image))
		g_hash_table_remove (loaded_images, (char *) image->assembly_name);	

	mono_images_unlock ();

#ifdef USE_COREE
	if (image->is_module_handle && image->has_entry_point) {
		mono_images_lock ();
		if (image->ref_count == 0) {
			/* Image will be closed by _CorDllMain. */
			FreeLibrary ((HMODULE) image->raw_data);
			mono_images_unlock ();
			return;
		}
		mono_images_unlock ();
	}
#endif

	mono_profiler_module_event (image, MONO_PROFILE_START_UNLOAD);

	mono_trace (G_LOG_LEVEL_INFO, MONO_TRACE_ASSEMBLY, "Unloading image %s [%p].", image->name, image);

	mono_metadata_clean_for_image (image);

	/*
	 * The caches inside a MonoImage might refer to metadata which is stored in referenced 
	 * assemblies, so we can't release these references in mono_assembly_close () since the
	 * MonoImage might outlive its associated MonoAssembly.
	 */
	if (image->references && !image->dynamic) {
		MonoTableInfo *t = &image->tables [MONO_TABLE_ASSEMBLYREF];
		int i;

		for (i = 0; i < t->rows; i++) {
			if (image->references [i])
				mono_assembly_close (image->references [i]);
		}

		g_free (image->references);
		image->references = NULL;
	}

#ifdef USE_COREE
	mono_images_lock ();
	if (image->is_module_handle && !image->has_entry_point)
		FreeLibrary ((HMODULE) image->raw_data);
	mono_images_unlock ();
#endif

	if (image->raw_buffer_used) {
		if (image->raw_data != NULL)
			mono_file_unmap (image->raw_data, image->raw_data_handle);
	}
	
	if (image->raw_data_allocated) {
		/* FIXME: do we need this? (image is disposed anyway) */
		/* image->raw_metadata and cli_sections might lie inside image->raw_data */
		MonoCLIImageInfo *ii = image->image_info;

		if ((image->raw_metadata > image->raw_data) &&
			(image->raw_metadata <= (image->raw_data + image->raw_data_len)))
			image->raw_metadata = NULL;

		for (i = 0; i < ii->cli_section_count; i++)
			if (((char*)(ii->cli_sections [i]) > image->raw_data) &&
				((char*)(ii->cli_sections [i]) <= ((char*)image->raw_data + image->raw_data_len)))
				ii->cli_sections [i] = NULL;

		g_free (image->raw_data);
	}

	if (debug_assembly_unload) {
		image->name = g_strdup_printf ("%s - UNLOADED", image->name);
	} else {
		g_free (image->name);
		g_free (image->guid);
		g_free (image->version);
		g_free (image->files);
	}

	if (image->method_cache)
		g_hash_table_destroy (image->method_cache);
	if (image->methodref_cache)
		g_hash_table_destroy (image->methodref_cache);
	mono_internal_hash_table_destroy (&image->class_cache);
	g_hash_table_destroy (image->field_cache);
	if (image->array_cache) {
		g_hash_table_foreach (image->array_cache, free_array_cache_entry, NULL);
		g_hash_table_destroy (image->array_cache);
	}
	if (image->szarray_cache)
		g_hash_table_destroy (image->szarray_cache);
	if (image->ptr_cache)
		g_hash_table_destroy (image->ptr_cache);
	if (image->name_cache) {
		g_hash_table_foreach (image->name_cache, free_hash_table, NULL);
		g_hash_table_destroy (image->name_cache);
	}

	free_hash (image->native_wrapper_cache);
	free_hash (image->managed_wrapper_cache);
	free_hash (image->delegate_begin_invoke_cache);
	free_hash (image->delegate_end_invoke_cache);
	free_hash (image->delegate_invoke_cache);
	free_hash (image->delegate_abstract_invoke_cache);
	if (image->remoting_invoke_cache)
		g_hash_table_foreach (image->remoting_invoke_cache, free_remoting_wrappers, NULL);
	free_hash (image->remoting_invoke_cache);
	free_hash (image->runtime_invoke_cache);
	free_hash (image->runtime_invoke_direct_cache);
	free_hash (image->runtime_invoke_vcall_cache);
	free_hash (image->synchronized_cache);
	free_hash (image->unbox_wrapper_cache);
	free_hash (image->cominterop_invoke_cache);
	free_hash (image->cominterop_wrapper_cache);
	free_hash (image->typespec_cache);
	free_hash (image->ldfld_wrapper_cache);
	free_hash (image->ldflda_wrapper_cache);
	free_hash (image->stfld_wrapper_cache);
	free_hash (image->isinst_cache);
	free_hash (image->castclass_cache);
	free_hash (image->proxy_isinst_cache);
	free_hash (image->thunk_invoke_cache);

	/* The ownership of signatures is not well defined */
	//g_hash_table_foreach (image->memberref_signatures, free_mr_signatures, NULL);
	g_hash_table_destroy (image->memberref_signatures);
	//g_hash_table_foreach (image->helper_signatures, free_mr_signatures, NULL);
	g_hash_table_destroy (image->helper_signatures);
	g_hash_table_destroy (image->method_signatures);

	if (image->generic_class_cache)
		g_hash_table_destroy (image->generic_class_cache);

	if (image->rgctx_template_hash)
		g_hash_table_destroy (image->rgctx_template_hash);

	if (image->property_hash)
		mono_property_hash_destroy (image->property_hash);

	g_slist_free (image->reflection_info_unregister_classes);

	if (image->interface_bitset) {
		mono_unload_interface_ids (image->interface_bitset);
		mono_bitset_free (image->interface_bitset);
	}
	if (image->image_info){
		MonoCLIImageInfo *ii = image->image_info;

		if (ii->cli_section_tables)
			g_free (ii->cli_section_tables);
		if (ii->cli_sections)
			g_free (ii->cli_sections);
		g_free (image->image_info);
	}

	for (i = 0; i < image->module_count; ++i) {
		if (image->modules [i])
			mono_image_close (image->modules [i]);
	}
	if (image->modules)
		g_free (image->modules);
	if (image->modules_loaded)
		g_free (image->modules_loaded);
	if (image->references)
		g_free (image->references);
	mono_perfcounters->loader_bytes -= mono_mempool_get_allocated (image->mempool);

	DeleteCriticalSection (&image->szarray_cache_lock);
	DeleteCriticalSection (&image->lock);

	/*g_print ("destroy image %p (dynamic: %d)\n", image, image->dynamic);*/
	if (!image->dynamic) {
		if (debug_assembly_unload)
			mono_mempool_invalidate (image->mempool);
		else {
			mono_mempool_destroy (image->mempool);
			g_free (image);
		}
	} else {
		/* Dynamic images are GC_MALLOCed */
		g_free ((char*)image->module_name);
		mono_dynamic_image_free ((MonoDynamicImage*)image);
		if (debug_assembly_unload)
			mono_mempool_invalidate (image->mempool);
		else
			mono_mempool_destroy (image->mempool);
	}

	mono_profiler_module_event (image, MONO_PROFILE_END_UNLOAD);
}

/** 
 * mono_image_strerror:
 * @status: an code indicating the result from a recent operation
 *
 * Returns: a string describing the error
 */
const char *
mono_image_strerror (MonoImageOpenStatus status)
{
	switch (status){
	case MONO_IMAGE_OK:
		return "success";
	case MONO_IMAGE_ERROR_ERRNO:
		return strerror (errno);
	case MONO_IMAGE_IMAGE_INVALID:
		return "File does not contain a valid CIL image";
	case MONO_IMAGE_MISSING_ASSEMBLYREF:
		return "An assembly was referenced, but could not be found";
	}
	return "Internal error";
}

static gpointer
mono_image_walk_resource_tree (MonoCLIImageInfo *info, guint32 res_id,
			       guint32 lang_id, gunichar2 *name,
			       MonoPEResourceDirEntry *entry,
			       MonoPEResourceDir *root, guint32 level)
{
	gboolean is_string, is_dir;
	guint32 name_offset, dir_offset;

	/* Level 0 holds a directory entry for each type of resource
	 * (identified by ID or name).
	 *
	 * Level 1 holds a directory entry for each named resource
	 * item, and each "anonymous" item of a particular type of
	 * resource.
	 *
	 * Level 2 holds a directory entry for each language pointing to
	 * the actual data.
	 */
	is_string = MONO_PE_RES_DIR_ENTRY_NAME_IS_STRING (*entry);
	name_offset = MONO_PE_RES_DIR_ENTRY_NAME_OFFSET (*entry);

	is_dir = MONO_PE_RES_DIR_ENTRY_IS_DIR (*entry);
	dir_offset = MONO_PE_RES_DIR_ENTRY_DIR_OFFSET (*entry);

	if(level==0) {
		if (is_string)
			return NULL;
	} else if (level==1) {
		if (res_id != name_offset)
			return NULL;
#if 0
		if(name!=NULL &&
		   is_string==TRUE && name!=lookup (name_offset)) {
			return(NULL);
		}
#endif
	} else if (level==2) {
		if (is_string == TRUE || (is_string == FALSE && lang_id != 0 && name_offset != lang_id))
			return NULL;
	} else {
		g_assert_not_reached ();
	}

	if(is_dir==TRUE) {
		MonoPEResourceDir *res_dir=(MonoPEResourceDir *)(((char *)root)+dir_offset);
		MonoPEResourceDirEntry *sub_entries=(MonoPEResourceDirEntry *)(res_dir+1);
		guint32 entries, i;

		entries = GUINT16_FROM_LE (res_dir->res_named_entries) + GUINT16_FROM_LE (res_dir->res_id_entries);

		for(i=0; i<entries; i++) {
			MonoPEResourceDirEntry *sub_entry=&sub_entries[i];
			gpointer ret;
			
			ret=mono_image_walk_resource_tree (info, res_id,
							   lang_id, name,
							   sub_entry, root,
							   level+1);
			if(ret!=NULL) {
				return(ret);
			}
		}

		return(NULL);
	} else {
		MonoPEResourceDataEntry *data_entry=(MonoPEResourceDataEntry *)((char *)(root)+dir_offset);
		MonoPEResourceDataEntry *res;

		res = g_new0 (MonoPEResourceDataEntry, 1);

		res->rde_data_offset = GUINT32_TO_LE (data_entry->rde_data_offset);
		res->rde_size = GUINT32_TO_LE (data_entry->rde_size);
		res->rde_codepage = GUINT32_TO_LE (data_entry->rde_codepage);
		res->rde_reserved = GUINT32_TO_LE (data_entry->rde_reserved);

		return (res);
	}
}

/**
 * mono_image_lookup_resource:
 * @image: the image to look up the resource in
 * @res_id: A MONO_PE_RESOURCE_ID_ that represents the resource ID to lookup.
 * @lang_id: The language id.
 * @name: the resource name to lookup.
 *
 * Returns: NULL if not found, otherwise a pointer to the in-memory representation
 * of the given resource. The caller should free it using g_free () when no longer
 * needed.
 */
gpointer
mono_image_lookup_resource (MonoImage *image, guint32 res_id, guint32 lang_id, gunichar2 *name)
{
	MonoCLIImageInfo *info;
	MonoDotNetHeader *header;
	MonoPEDatadir *datadir;
	MonoPEDirEntry *rsrc;
	MonoPEResourceDir *resource_dir;
	MonoPEResourceDirEntry *res_entries;
	guint32 entries, i;

	if(image==NULL) {
		return(NULL);
	}

	mono_image_ensure_section_idx (image, MONO_SECTION_RSRC);

	info=image->image_info;
	if(info==NULL) {
		return(NULL);
	}

	header=&info->cli_header;
	if(header==NULL) {
		return(NULL);
	}

	datadir=&header->datadir;
	if(datadir==NULL) {
		return(NULL);
	}

	rsrc=&datadir->pe_resource_table;
	if(rsrc==NULL) {
		return(NULL);
	}

	resource_dir=(MonoPEResourceDir *)mono_image_rva_map (image, rsrc->rva);
	if(resource_dir==NULL) {
		return(NULL);
	}

	entries = GUINT16_FROM_LE (resource_dir->res_named_entries) + GUINT16_FROM_LE (resource_dir->res_id_entries);
	res_entries=(MonoPEResourceDirEntry *)(resource_dir+1);
	
	for(i=0; i<entries; i++) {
		MonoPEResourceDirEntry *entry=&res_entries[i];
		gpointer ret;
		
		ret=mono_image_walk_resource_tree (info, res_id, lang_id,
						   name, entry, resource_dir,
						   0);
		if(ret!=NULL) {
			return(ret);
		}
	}

	return(NULL);
}

/** 
 * mono_image_get_entry_point:
 * @image: the image where the entry point will be looked up.
 *
 * Use this routine to determine the metadata token for method that
 * has been flagged as the entry point.
 *
 * Returns: the token for the entry point method in the image
 */
guint32
mono_image_get_entry_point (MonoImage *image)
{
	return ((MonoCLIImageInfo*)image->image_info)->cli_cli_header.ch_entry_point;
}

/**
 * mono_image_get_resource:
 * @image: the image where the resource will be looked up.
 * @offset: The offset to add to the resource
 * @size: a pointer to an int where the size of the resource will be stored
 *
 * This is a low-level routine that fetches a resource from the
 * metadata that starts at a given @offset.  The @size parameter is
 * filled with the data field as encoded in the metadata.
 *
 * Returns: the pointer to the resource whose offset is @offset.
 */
const char*
mono_image_get_resource (MonoImage *image, guint32 offset, guint32 *size)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	MonoCLIHeader *ch = &iinfo->cli_cli_header;
	const char* data;

	if (!ch->ch_resources.rva || offset + 4 > ch->ch_resources.size)
		return NULL;
	
	data = mono_image_rva_map (image, ch->ch_resources.rva);
	if (!data)
		return NULL;
	data += offset;
	if (size)
		*size = read32 (data);
	data += 4;
	return data;
}

MonoImage*
mono_image_load_file_for_image (MonoImage *image, int fileidx)
{
	char *base_dir, *name;
	MonoImage *res;
	MonoTableInfo  *t = &image->tables [MONO_TABLE_FILE];
	const char *fname;
	guint32 fname_id;

	if (fileidx < 1 || fileidx > t->rows)
		return NULL;

	mono_loader_lock ();
	if (image->files && image->files [fileidx - 1]) {
		mono_loader_unlock ();
		return image->files [fileidx - 1];
	}

	if (!image->files)
		image->files = g_new0 (MonoImage*, t->rows);

	fname_id = mono_metadata_decode_row_col (t, fileidx - 1, MONO_FILE_NAME);
	fname = mono_metadata_string_heap (image, fname_id);
	base_dir = g_path_get_dirname (image->name);
	name = g_build_filename (base_dir, fname, NULL);
	res = mono_image_open (name, NULL);
	if (res) {
		int i;
		/* g_print ("loaded file %s from %s (%p)\n", name, image->name, image->assembly); */
		res->assembly = image->assembly;
		for (i = 0; i < res->module_count; ++i) {
			if (res->modules [i] && !res->modules [i]->assembly)
				res->modules [i]->assembly = image->assembly;
		}

		image->files [fileidx - 1] = res;
#ifdef USE_COREE
		if (res->is_module_handle)
			mono_image_fixup_vtable (res);
#endif
	}
	mono_loader_unlock ();
	g_free (name);
	g_free (base_dir);
	return res;
}

/**
 * mono_image_get_strong_name:
 * @image: a MonoImage
 * @size: a guint32 pointer, or NULL.
 *
 * If the image has a strong name, and @size is not NULL, the value
 * pointed to by size will have the size of the strong name.
 *
 * Returns: NULL if the image does not have a strong name, or a
 * pointer to the public key.
 */
const char*
mono_image_get_strong_name (MonoImage *image, guint32 *size)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	MonoPEDirEntry *de = &iinfo->cli_cli_header.ch_strong_name;
	const char* data;

	if (!de->size || !de->rva)
		return NULL;
	data = mono_image_rva_map (image, de->rva);
	if (!data)
		return NULL;
	if (size)
		*size = de->size;
	return data;
}

/**
 * mono_image_strong_name_position:
 * @image: a MonoImage
 * @size: a guint32 pointer, or NULL.
 *
 * If the image has a strong name, and @size is not NULL, the value
 * pointed to by size will have the size of the strong name.
 *
 * Returns: the position within the image file where the strong name
 * is stored.
 */
guint32
mono_image_strong_name_position (MonoImage *image, guint32 *size)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	MonoPEDirEntry *de = &iinfo->cli_cli_header.ch_strong_name;
	guint32 pos;

	if (size)
		*size = de->size;
	if (!de->size || !de->rva)
		return 0;
	pos = mono_cli_rva_image_map (image, de->rva);
	return pos == INVALID_ADDRESS ? 0 : pos;
}

/**
 * mono_image_get_public_key:
 * @image: a MonoImage
 * @size: a guint32 pointer, or NULL.
 *
 * This is used to obtain the public key in the @image.
 * 
 * If the image has a public key, and @size is not NULL, the value
 * pointed to by size will have the size of the public key.
 * 
 * Returns: NULL if the image does not have a public key, or a pointer
 * to the public key.
 */
const char*
mono_image_get_public_key (MonoImage *image, guint32 *size)
{
	const char *pubkey;
	guint32 len, tok;

	if (image->dynamic) {
		if (size)
			*size = ((MonoDynamicImage*)image)->public_key_len;
		return (char*)((MonoDynamicImage*)image)->public_key;
	}
	if (image->tables [MONO_TABLE_ASSEMBLY].rows != 1)
		return NULL;
	tok = mono_metadata_decode_row_col (&image->tables [MONO_TABLE_ASSEMBLY], 0, MONO_ASSEMBLY_PUBLIC_KEY);
	if (!tok)
		return NULL;
	pubkey = mono_metadata_blob_heap (image, tok);
	len = mono_metadata_decode_blob_size (pubkey, &pubkey);
	if (size)
		*size = len;
	return pubkey;
}

/**
 * mono_image_get_name:
 * @name: a MonoImage
 *
 * Returns: the name of the assembly.
 */
const char*
mono_image_get_name (MonoImage *image)
{
	return image->assembly_name;
}

/**
 * mono_image_get_filename:
 * @image: a MonoImage
 *
 * Used to get the filename that hold the actual MonoImage
 *
 * Returns: the filename.
 */
const char*
mono_image_get_filename (MonoImage *image)
{
	return image->name;
}

const char*
mono_image_get_guid (MonoImage *image)
{
	return image->guid;
}

const MonoTableInfo*
mono_image_get_table_info (MonoImage *image, int table_id)
{
	if (table_id < 0 || table_id >= MONO_TABLE_NUM)
		return NULL;
	return &image->tables [table_id];
}

int
mono_image_get_table_rows (MonoImage *image, int table_id)
{
	if (table_id < 0 || table_id >= MONO_TABLE_NUM)
		return 0;
	return image->tables [table_id].rows;
}

int
mono_table_info_get_rows (const MonoTableInfo *table)
{
	return table->rows;
}

/**
 * mono_image_get_assembly:
 * @image: the MonoImage.
 *
 * Use this routine to get the assembly that owns this image.
 *
 * Returns: the assembly that holds this image.
 */
MonoAssembly* 
mono_image_get_assembly (MonoImage *image)
{
	return image->assembly;
}

/**
 * mono_image_is_dynamic:
 * @image: the MonoImage
 *
 * Determines if the given image was created dynamically through the
 * System.Reflection.Emit API
 *
 * Returns: TRUE if the image was created dynamically, FALSE if not.
 */
gboolean
mono_image_is_dynamic (MonoImage *image)
{
	return image->dynamic;
}

/**
 * mono_image_has_authenticode_entry:
 * @image: the MonoImage
 *
 * Use this routine to determine if the image has a Authenticode
 * Certificate Table.
 *
 * Returns: TRUE if the image contains an authenticode entry in the PE
 * directory.
 */
gboolean
mono_image_has_authenticode_entry (MonoImage *image)
{
	MonoCLIImageInfo *iinfo = image->image_info;
	MonoDotNetHeader *header = &iinfo->cli_header;
	MonoPEDirEntry *de = &header->datadir.pe_certificate_table;
	// the Authenticode "pre" (non ASN.1) header is 8 bytes long
	return ((de->rva != 0) && (de->size > 8));
}

gpointer
mono_image_alloc (MonoImage *image, guint size)
{
	gpointer res;

	mono_perfcounters->loader_bytes += size;
	mono_image_lock (image);
	res = mono_mempool_alloc (image->mempool, size);
	mono_image_unlock (image);

	return res;
}

gpointer
mono_image_alloc0 (MonoImage *image, guint size)
{
	gpointer res;

	mono_perfcounters->loader_bytes += size;
	mono_image_lock (image);
	res = mono_mempool_alloc0 (image->mempool, size);
	mono_image_unlock (image);

	return res;
}

char*
mono_image_strdup (MonoImage *image, const char *s)
{
	char *res;

	mono_perfcounters->loader_bytes += strlen (s);
	mono_image_lock (image);
	res = mono_mempool_strdup (image->mempool, s);
	mono_image_unlock (image);

	return res;
}

GList*
g_list_prepend_image (MonoImage *image, GList *list, gpointer data)
{
	GList *new_list;
	
	new_list = mono_image_alloc (image, sizeof (GList));
	new_list->data = data;
	new_list->prev = list ? list->prev : NULL;
    new_list->next = list;

    if (new_list->prev)
            new_list->prev->next = new_list;
    if (list)
            list->prev = new_list;

	return new_list;
}

GSList*
g_slist_append_image (MonoImage *image, GSList *list, gpointer data)
{
	GSList *new_list;

	new_list = mono_image_alloc (image, sizeof (GSList));
	new_list->data = data;
	new_list->next = NULL;

	return g_slist_concat (list, new_list);
}

void
mono_image_lock (MonoImage *image)
{
	mono_locks_acquire (&image->lock, ImageDataLock);
}

void
mono_image_unlock (MonoImage *image)
{
	mono_locks_release (&image->lock, ImageDataLock);
}


/**
 * mono_image_property_lookup:
 *
 * Lookup a property on @image. Used to store very rare fields of MonoClass and MonoMethod.
 *
 * LOCKING: Takes the image lock
 */
gpointer 
mono_image_property_lookup (MonoImage *image, gpointer subject, guint32 property)
{
	gpointer res;

	mono_image_lock (image);
	res = mono_property_hash_lookup (image->property_hash, subject, property);
 	mono_image_unlock (image);

	return res;
}

/**
 * mono_image_property_insert:
 *
 * Insert a new property @property with value @value on @subject in @image. Used to store very rare fields of MonoClass and MonoMethod.
 *
 * LOCKING: Takes the image lock
 */
void
mono_image_property_insert (MonoImage *image, gpointer subject, guint32 property, gpointer value)
{
	mono_image_lock (image);
	mono_property_hash_insert (image->property_hash, subject, property, value);
 	mono_image_unlock (image);
}

/**
 * mono_image_property_remove:
 *
 * Remove all properties associated with @subject in @image. Used to store very rare fields of MonoClass and MonoMethod.
 *
 * LOCKING: Takes the image lock
 */
void
mono_image_property_remove (MonoImage *image, gpointer subject)
{
	mono_image_lock (image);
	mono_property_hash_remove_object (image->property_hash, subject);
 	mono_image_unlock (image);
}
