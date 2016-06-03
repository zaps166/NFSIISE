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
