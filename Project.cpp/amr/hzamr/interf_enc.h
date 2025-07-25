/*
 * ===================================================================
 *  TS 26.104
 *  REL-5 V5.4.0 2004-03
 *  REL-6 V6.1.0 2004-03
 *  3GPP AMR Floating-point Speech Codec
 * ===================================================================
 *
 */

/*
 * interf_enc.h
 *
 *
 * Project:
 *    AMR Floating-Point Codec
 *
 * Contains:
 *    Defines interface to AMR encoder
 *
 */

#ifndef _interf_enc_h_
#define _interf_enc_h_

#if _MSC_VER // this is defined when compiling with Visual Studio
#define EXPORT_API __declspec(dllexport) // Visual Studio needs annotating exported functions with this
#else
#define EXPORT_API // XCode does not need annotating exported functions, so define is empty
#endif

/*
 * include files
 */
#include"sp_enc.h"

#ifdef __cplusplus
extern "C" {
#endif
/*
 * Function prototypes
 */
/*
 * Encodes one frame of speech
 * Returns packed octets
 */
	EXPORT_API int Encoder_Interface_Encode(void *st, enum Mode mode, short *speech,

#ifndef ETSI
      unsigned char *serial,  /* max size 31 bytes */

#else
      short *serial, /* size 500 bytes */
#endif

      int forceSpeech );   /* use speech mode */

/*
 * Reserve and init. memory
 */
	EXPORT_API void *Encoder_Interface_init(int dtx);

/*
 * Exit and free memory
 */
	EXPORT_API void Encoder_Interface_exit(void *state);

#ifdef __cplusplus
}
#endif
#endif
