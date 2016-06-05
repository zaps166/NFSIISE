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

#ifndef USER32_H
#define USER32_H

#include "Wrapper.h"

enum
{
	WM_CHR_SDL   = 0x0001,

	WM_DESTROY   = 0x0002,
	WM_SETFOCUS  = 0x0007,
	WM_KILLFOCUS = 0x0008,

	WM_KEYDOWN   = 0x0100,
	WM_KEYUP     = 0x0101,
	WM_CHAR      = 0x0102,

	WM_USER      = 0x0400,
	WM_USER_END  = 0xC000
};

typedef struct
{
	void *hWnd;
	uint32_t uMsg;
	uint32_t wParam;
	uint32_t lParam;
	uint32_t time;
	uint32_t pt[2];
} MSG;

#endif // USER32_H
