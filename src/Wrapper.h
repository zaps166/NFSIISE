/*
	This is a port of the Windows game Need For Speed™ II Special Edition.
	Copyright (C) 2014-2016  Błażej Szczygieł

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef WRAPPER_H
#define WRAPPER_H

#ifndef WIN32
	#define _GNU_SOURCE
#endif

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#ifdef STACK_REALIGN
	#define REALIGN __attribute__((force_align_arg_pointer))
#else
	#define REALIGN
#endif

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
