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

#include "Wrapper.h"

#ifdef WIN32
	#include <windows.h>
	#include <mmsystem.h>
#else
	typedef void TIMECAPS;
#endif

REALIGN STDCALL uint32_t timeBeginPeriod_wrap(uint32_t period)
{
#ifdef WIN32
	return timeBeginPeriod(period);
#else
	return 0;
#endif
}
REALIGN STDCALL uint32_t timeEndPeriod_wrap(uint32_t period)
{
#ifdef WIN32
	return timeEndPeriod(period);
#else
	return 0;
#endif
}
REALIGN STDCALL uint32_t timeGetDevCaps_wrap(TIMECAPS *tc, uint32_t cbtc)
{
#ifdef WIN32
	return timeGetDevCaps(tc, cbtc);
#else
	return 0;
#endif
}
