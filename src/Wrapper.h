#ifndef WRAPPER_H
#define WRAPPER_H

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#define STDCALL __attribute__((stdcall))
#define REGPARM __attribute__((regparm(2))) //first two arguments are compatible with Watcom fastcall

#define MAX_PATH 260

#define BOOL int32_t
#define false 0
#define true 1

#define BoolToStr( b ) b ? "true" : "false"

typedef uint32_t ( STDCALL *WindowProc )( void *hWnd, uint32_t uMsg, uint32_t wParam, uint32_t lParam );

#endif // WRAPPER_H
