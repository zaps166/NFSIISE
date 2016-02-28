#ifndef WRAPPER_H
#define WRAPPER_H

#ifndef WIN32
	#define _GNU_SOURCE
#endif

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#define STDCALL __attribute__((stdcall))
#define REGPARM __attribute__((regparm(2))) //First two arguments are compatible with Watcom fastcall

#define MAX_PATH 260
#define NUM_BUFFERS_TO_CLEAR 7 //This should be enough

#define BOOL int32_t
#define false 0
#define true 1

typedef uint32_t (STDCALL *WindowProc)(void *hWnd, uint32_t uMsg, uint32_t wParam, uint32_t lParam);

char *convertFilePath(const char *srcPth, BOOL convToLower);

#endif // WRAPPER_H
