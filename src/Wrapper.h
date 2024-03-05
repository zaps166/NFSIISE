// SPDX-License-Identifier: MIT

#ifndef WRAPPER_H
#define WRAPPER_H

#ifndef WIN32
	#define _GNU_SOURCE
#endif

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#if !defined(NFS_CPP) && (defined(__i386) || defined(__i386__))
	#define STDCALL __attribute__((stdcall))
	#define REGPARM __attribute__((regparm(2))) //First two arguments are compatible with Watcom fastcall

	#define MAYBE_THIS_SINGLE void
	#define MAYBE_THIS
#else
	#define STDCALL
	#define REGPARM

	#define MAYBE_THIS_SINGLE void *this
	#define MAYBE_THIS void *this,

	#ifndef NFS_CPP
		#define NFS_CPP
	#endif
#endif

#if !defined(NFS_CPP) && defined(STACK_REALIGN)
	#define REALIGN __attribute__((force_align_arg_pointer))
#else
	#define REALIGN
#endif

#define MAX_PATH 260

#define BOOL int32_t
#define false 0
#define true 1

typedef uint32_t (STDCALL *WindowProc)(MAYBE_THIS void *hWnd, uint32_t uMsg, uint32_t wParam, uint32_t lParam);

char *convertFilePath(const char *srcPth, BOOL convToLower);

#endif // WRAPPER_H
