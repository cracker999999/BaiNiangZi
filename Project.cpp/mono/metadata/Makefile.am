if PLATFORM_WIN32
win32_sources = \
	console-win32.c

platform_sources = $(win32_sources)

# Use -m here. This will use / as directory separator (C:/WINNT).
# The files that use MONO_ASSEMBLIES and/or MONO_CFG_DIR replace the
# / by \ if running under WIN32.
if CROSS_COMPILING
assembliesdir = ${libdir}
confdir = ${sysconfdir}
else
assembliesdir = `cygpath -m "${libdir}"`
confdir = `cygpath -m "${sysconfdir}"`
endif
export HOST_CC
# The mingw math.h has "extern inline" functions that dont appear in libs, so
# optimisation is required to actually inline them
AM_CFLAGS = -O
else

assembliesdir = $(exec_prefix)/lib
confdir = $(sysconfdir)
unix_sources = \
	console-unix.c

platform_sources = $(unix_sources)
endif

if CROSS_COMPILING
bin_PROGRAMS = 
else
bin_PROGRAMS = pedump
endif

#
# libtool is not capable of creating static/shared versions of the same
# convenience lib, so we have to do it ourselves
#
noinst_LTLIBRARIES = libmonoruntime.la libmonoruntime-static.la

INCLUDES = -I$(top_srcdir) -I$(top_srcdir)/mono $(LIBGC_CFLAGS) $(GLIB_CFLAGS) -DMONO_BINDIR=\"$(bindir)/\" -DMONO_ASSEMBLIES=\"$(assembliesdir)\" -DMONO_CFG_DIR=\"$(confdir)\"

#
# Make sure any prefix changes are updated in the binaries too.
#
#  assembly.c uses MONO_ASSEMBLIES
#  mono-config.c uses MONO_CFG_DIR
#
# This won't result in many more false positives than AC_DEFINEing them
# in configure.in.
#
assembly.lo mono-config.lo: Makefile

CLEANFILES = mono-bundle.stamp

libmonoruntime_static_la_LIBADD = $(bundle_obj) $(libmonoruntime_la_LIBADD)

null_sources = \
	console-null.c

libmonoruntime_la_SOURCES = \
	$(platform_sources)	\
	../../unity/unity_utils.c	\
	../../unity/unity_liveness.c	\
	appdomain.c		\
	assembly.c		\
	attach.h		\
	attach.c		\
	boehm-gc.c		\
	char-conversions.h	\
	cil-coff.h		\
	class.c			\
	class-internals.h	\
	cominterop.c		\
	cominterop.h		\
	console-io.h		\
	coree.c 		\
	coree.h 		\
	culture-info.h  	\
	culture-info-tables.h	\
	debug-helpers.c		\
	debug-mono-symfile.h	\
	debug-mono-symfile.c	\
	decimal.c		\
	decimal.h		\
	domain.c		\
	domain-internals.h	\
	environment.c		\
	environment.h		\
	exception.c		\
	exception.h		\
	file-io.c		\
	file-io.h		\
	filewatcher.c		\
	filewatcher.h		\
	gc.c			\
	gc-internal.h		\
	generic-sharing.c	\
	icall.c			\
	icall-def.h		\
	xxtea.c			\
	image.c			\
	loader.c		\
	locales.c		\
	locales.h		\
	lock-tracer.c		\
	lock-tracer.h		\
	marshal.c		\
	marshal.h		\
	mempool.c		\
	mempool-internals.h	\
	metadata.c		\
	metadata-verify.c	\
	metadata-internals.h	\
	method-builder.h 	\
	method-builder.c 	\
	mono-basic-block.c	\
	mono-basic-block.h	\
	mono-config.c		\
	mono-debug.h		\
	mono-debug.c		\
	mono-debug-debugger.h	\
	mono-debug-debugger.c	\
	mono-endian.c		\
	mono-endian.h		\
	mono-mlist.c		\
	mono-mlist.h		\
	mono-perfcounters.c	\
	mono-perfcounters.h	\
	mono-perfcounters-def.h	\
	monitor.c		\
	monitor.h		\
	normalization-tables.h	\
	null-gc.c		\
	number-formatter.h	\
	object.c		\
	object-internals.h	\
	opcodes.c		\
	socket-io.c		\
	socket-io.h		\
	process.c		\
	process.h		\
	profiler.c		\
	profiler-private.h	\
	rand.h			\
	rand.c			\
	reflection.c		\
	security.c		\
	security.h		\
	security-core-clr.c	\
	security-core-clr.h	\
	security-manager.c	\
	security-manager.h	\
	sgen-gc.c		\
	sgen-gc.h		\
	sgen-archdep.h		\
	sgen-scan-object.h	\
	string-icalls.c 	\
	string-icalls.h 	\
	sysmath.h		\
	sysmath.c		\
	tabledefs.h 		\
	threads.c		\
	threads-types.h		\
	threadpool.c		\
	threadpool.h		\
	threadpool-internals.h	\
	verify.c		\
	verify-internals.h	\
	wrapper-types.h

libmonoruntime_static_la_SOURCES = $(libmonoruntime_la_SOURCES)

libmonoruntime_static_la_LDFLAGS = -static

libmonoruntimeincludedir = $(includedir)/mono-$(API_VER)/mono/metadata

libmonoruntimeinclude_HEADERS = \
	assembly.h		\
	attrdefs.h		\
	appdomain.h		\
	blob.h			\
	class.h			\
	debug-helpers.h		\
	debug-mono-symfile.h	\
	threads.h		\
	environment.h		\
	exception.h		\
	xxtea.h			\
	image.h			\
	loader.h		\
	mempool.h		\
	metadata.h		\
	mono-config.h		\
	mono-debug.h		\
	mono-gc.h		\
	object.h		\
	opcodes.h		\
	profiler.h		\
	reflection.h		\
	row-indexes.h		\
	tokentype.h		\
	verify.h		

if DTRACE_G_REQUIRED

PEDUMP_DTRACE_OBJECT = pedump-dtrace.$(OBJEXT)

pedump-dtrace.$(OBJEXT): $(top_srcdir)/data/mono.d libmonoruntime.la ../io-layer/libwapi.la ../utils/libmonoutils.la
	DTRACE="$(DTRACE)" DTRACEFLAGS="$(DTRACEFLAGS)" AR="$(AR)" $(SHELL) $(top_srcdir)/data/dtrace-prelink.sh \
	--pic pedump-dtrace.$(OBJEXT) $(top_srcdir)/data/mono.d libmonoruntime.la ../io-layer/libwapi.la ../utils/libmonoutils.la

else
PEDUMP_DTRACE_OBJECT = 
endif

pedump_SOURCES =		\
	pedump.c

pedump_LDADD = libmonoruntime.la ../io-layer/libwapi.la ../utils/libmonoutils.la \
	$(LIBGC_LIBS) $(GLIB_LIBS) -lm $(PEDUMP_DTRACE_OBJECT)

EXTRA_DIST = make-bundle.pl sample-bundle $(win32_sources) $(unix_sources) $(null_sources)

