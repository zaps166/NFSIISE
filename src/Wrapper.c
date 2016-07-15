/*
	MIT License

	Copyright (c) 2014-2016 Błażej Szczygieł

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
*/

#include "Wrapper.h"
#include "Version"
#include <SDL2/SDL.h>
#ifdef WIN32
	#include <windows.h>
#endif

static char title[128] = "Need For Speed II SE (wrapper v1.0.2, game v";

#if defined(SDL_VIDEO_DRIVER_X11) && defined(SDL_VIDEO_DRIVER_X11_DYNAMIC_XVIDMODE)
	#include <SDL2/SDL_loadso.h>
	#include <SDL2/SDL_syswm.h>
	typedef struct {float red, green, blue;} XF86VidModeGamma;
	typedef BOOL (*_XF86VidModeGetGamma)(Display *, int, XF86VidModeGamma *);
	typedef BOOL (*_XF86VidModeSetGamma)(Display *, int, XF86VidModeGamma *);
	#define USE_X11_GAMMA
#endif

typedef void (*ProcedureType)(void);
static ProcedureType atExitProcedures[10];
static uint32_t atExitProcedureCount;
REALIGN STDCALL void WrapperAtExit(ProcedureType proc)
{
	uint32_t i;
	for (i = 0; i < atExitProcedureCount; ++i)
		if (proc == atExitProcedures[i])
			return;
	if (atExitProcedureCount < 10)
		atExitProcedures[atExitProcedureCount++] = proc;
}

uint32_t watchdogTimer(uint32_t interval, void *param)
{
	exit(0);
}

SDL_Window *sdlWin = NULL;

void SetBrightness(float val)
{
	/* This function exists because SDL2 uses function for brightness which is not supported by opensource X11 drivers */
	/* val < 0.0f tries to restore the brightness, less than -1.0 doesn't affect SDL function */
#ifdef USE_X11_GAMMA
	static BOOL firstCall = true;
	SDL_SysWMinfo sysInfo;
	SDL_VERSION(&sysInfo.version);
	if (SDL_GetWindowWMInfo(sdlWin, &sysInfo) && sysInfo.subsystem == SDL_SYSWM_X11)
	{
		static XF86VidModeGamma gammaToRestore = {-1.0f, -1.0f, -1.0f};
		static _XF86VidModeGetGamma XF86VidModeGetGamma;
		static _XF86VidModeSetGamma XF86VidModeSetGamma;
		if (firstCall && (!XF86VidModeGetGamma || !XF86VidModeSetGamma))
		{
			void *Xxf86vm = SDL_LoadObject(SDL_VIDEO_DRIVER_X11_DYNAMIC_XVIDMODE);
			if (Xxf86vm)
			{
				XF86VidModeGetGamma = SDL_LoadFunction(Xxf86vm, "XF86VidModeGetGamma");
				XF86VidModeSetGamma = SDL_LoadFunction(Xxf86vm, "XF86VidModeSetGamma");
			}
		}
		firstCall = false;
		if (XF86VidModeGetGamma && XF86VidModeSetGamma)
		{
			int screen = SDL_GetWindowDisplayIndex(sdlWin);
			if (screen < 0)
				screen = 0;
			if (gammaToRestore.red == -1.0f && gammaToRestore.green == -1.0f && gammaToRestore.blue == -1.0f)
				XF86VidModeGetGamma(sysInfo.info.x11.display, screen, &gammaToRestore); //Get brightness at first attempt
			if (val < 0.0f)
			{
				if (gammaToRestore.red >= 0.0f && gammaToRestore.green >= 0.0f && gammaToRestore.blue >= 0.0f && XF86VidModeSetGamma(sysInfo.info.x11.display, screen, &gammaToRestore)) //Restore brightness
					return;
				else
					val = 1.0f;
			}
			if (val >= 0.0f)
			{
				XF86VidModeGamma gamma = {val, val, val};
				if (XF86VidModeSetGamma(sysInfo.info.x11.display, screen, &gamma)) //Set brightness
					return;
			}
		}
	}
#endif
	if (val >= -1.0f)
		SDL_SetWindowBrightness(sdlWin, val < 0.0f ? 1.0f : val);
}

static char *settingsDir = NULL;

#ifndef WIN32
char *serialPort[4] = {NULL};
SDL_mutex *event_mutex;
SDL_cond *event_cond;
static
#endif
void exit_func(void)
{
	SDL_TimerID timerID;
	uint32_t i;
	for (i = 0; i < atExitProcedureCount; ++i)
	{
		timerID = SDL_AddTimer(2500, watchdogTimer, NULL);
		atExitProcedures[i]();
		SDL_RemoveTimer(timerID);
	}
#ifndef WIN32
	for (i = 0; i < 4; ++i)
		free(serialPort[i]);
#endif
	i = 250;
	while (sdlWin && i--)
		SDL_Delay(10);
#ifndef WIN32
	SDL_DestroyCond(event_cond);
	event_cond = NULL;
	SDL_DestroyMutex(event_mutex);
	event_mutex = NULL;
#endif
	free(settingsDir);
}

#ifndef WIN32
	#include <sys/stat.h>
#endif
#include <unistd.h>
#include <fcntl.h>

static char *createSettingsDirPath(const char *subdir, const char *fn)
{
	char *pth = (char *)malloc(strlen(settingsDir) + strlen(subdir) + 1 + strlen(fn) + 1);
	sprintf(pth, "%s%s/%s", settingsDir, subdir, fn);
	return pth;
}
char *convertFilePath(const char *srcPth, BOOL convToLower)
{
	char *tmpFileName = NULL;
	uint32_t i;
	if (settingsDir)
	{
		if (!strncasecmp(srcPth, ".\\fedata\\pc\\config\\", 19))
			tmpFileName = createSettingsDirPath("config", srcPth + 19);
		else if (!strncasecmp(srcPth, ".\\fedata\\pc\\save\\", 17))
			tmpFileName = createSettingsDirPath("save", srcPth + 17);
		else if (!strncasecmp(srcPth, ".\\gamedata\\tmptrk\\", 18))
			tmpFileName = createSettingsDirPath("tmptrk", srcPth + 18);
		else if (!strcasecmp(srcPth, "replay.rpy"))
			tmpFileName = createSettingsDirPath("tmptrk", srcPth);
		else if (!strncasecmp(srcPth, ".\\fedata\\pc\\stats\\", 18))
		{
			i = strlen(srcPth) - 4;
			if (i > 0 && !strcasecmp(srcPth + i, ".stf"))
			{
				if (!strncasecmp(srcPth, ".\\fedata\\pc\\stats\\prh\\", 22))
					tmpFileName = createSettingsDirPath("stats/prh", srcPth + 22);
				else
					tmpFileName = createSettingsDirPath("stats", srcPth + 18);
			}
		}
	}
	if (!tmpFileName)
	{
		tmpFileName = strdup(srcPth);
#ifndef WIN32
		for (i = 0; tmpFileName[i]; ++i)
		{
			if (tmpFileName[i] == '\\')
				tmpFileName[i] = '/';
			else if (convToLower)
				tmpFileName[i] = tolower(tmpFileName[i]);
		}
#endif
	}
	return tmpFileName;
}

static inline void mkdir_wrap(const char *path, uint32_t mode)
{
#ifdef WIN32
	CreateDirectoryA(path, NULL);
#else
	mkdir(path, mode);
#endif
}

static void checkGameDirs()
{
	static const char errorMessage[] = "Can't find \"gamedata\" and/or \"fedata\" directories in current working directory!"
#ifndef WIN32
		"\nBe sure that all files and directories have small letters!"
#endif
	;
	BOOL showErrorMessage = true;
#ifdef WIN32
	DWORD dwAttrib1 = GetFileAttributes("gamedata");
	DWORD dwAttrib2 = GetFileAttributes("fedata");
	if
	(
		dwAttrib1 != INVALID_FILE_ATTRIBUTES &&
		dwAttrib2 != INVALID_FILE_ATTRIBUTES &&
		(dwAttrib1 & FILE_ATTRIBUTE_DIRECTORY) &&
		(dwAttrib2 & FILE_ATTRIBUTE_DIRECTORY)
	) showErrorMessage = false;
#else
	struct stat st;
	if (!stat("gamedata", &st) && S_ISDIR(st.st_mode) && !stat("fedata", &st) && S_ISDIR(st.st_mode))
		showErrorMessage = false;
#endif
	if (showErrorMessage)
	{
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, errorMessage, NULL);
		exit(-1);
	}
}

#ifndef WIN32
#include <signal.h>
#include <sched.h>

static void signal_handler(int sig)
{
	static char errStr[40];
	if (sig == SIGINT || sig == SIGTERM)
	{
		exit(0);
		return;
	}
	if (sig == SIGPIPE)
		return;
	snprintf(errStr, sizeof errStr, "Application closed with a signal: %d", sig);
	fprintf(stderr, "%s\n", errStr);
	SetBrightness(-1.0f);
	SDL_SetWindowFullscreen(sdlWin, SDL_FALSE);
	SDL_ShowSimpleMessageBox(0, "Probably crash!", errStr, NULL);
	raise(SIGKILL);
}
#endif

static BOOL startInFullScreen = true;

int32_t joystickAxes[2][8] = {{0, 1, 2, 3, 0, 0, 0, 0}, {0, 1, 2, 3, 0, 0, 0, 0}};
int32_t winWidth = 640, winHeight = 480, joystickAxisValueShift[2] = {0}, vSync = 1;
int32_t joystickButtons[2][15] = {{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}};
BOOL useSpringForceFeedbackEffect = false;
#ifdef WIN32
	uint32_t windowsForceFeedbackDevice = -1;
#endif
BOOL linearSoundInterpolation = false, useGlBleginGlEnd = false, keepAspectRatio = true;
uint32_t fullScreenFlag = SDL_WINDOW_FULLSCREEN_DESKTOP, broadcast = 0xFFFFFFFF;
uint16_t PORT1 = 1030, PORT2 = 1029;

static void initializeSDL2()
{
	extern const char binaryGameVersion;
	strcat(title, &binaryGameVersion);
	strcat(title, ")");
	if (SDL_Init(SDL_INIT_EVERYTHING & ~SDL_INIT_GAMECONTROLLER) < 0)
		fprintf(stderr, "SDL_Init failed: %s\n", SDL_GetError());
}

#ifdef SWAP_WINDOW_AND_GL_THREAD
REALIGN
#endif
void WrapperInit(void)
{
#ifndef SWAP_WINDOW_AND_GL_THREAD
	initializeSDL2();
#endif

	BOOL useOnlyOneCPU = true;
	uint32_t msaa = 0;
	FILE *f = NULL;

	SDL_JoystickEventState(SDL_IGNORE);
	SDL_ShowCursor(false);

#ifdef WIN32
	const char *homeDir = getenv("AppData");
#else
	const char *homeDir = getenv("HOME");
#endif
	if (homeDir && *homeDir)
	{
		static const char subdirsToCreate[5][10] = {
			"config",
			"save",
			"stats",
			"stats/prh",
			"tmptrk"
		};
		char buffer[MAX_PATH];
		uint32_t pos, i;

		/* Creating ~/.nfs2se directory and subdirectories */
		strcpy(buffer, homeDir);
#ifdef __APPLE__
		strcat(buffer, "/Libary/Application Support/nfs2se/");
#else
		strcat(buffer, "/.nfs2se/");
#endif
		mkdir_wrap(buffer, 0755);
		pos = strlen(buffer);
		for (i = 0; i < 5; ++i)
		{
			strcpy(buffer + pos, subdirsToCreate[i]);
			mkdir_wrap(buffer, 0755);
		}

		/* Checking for nfs2se.conf and copying it at first tme to home dir */
		strcpy(buffer + pos, "nfs2se.conf");
		FILE *fSrc = fopen("nfs2se.conf.template", "r");
		if (fSrc)
		{
			FILE *fDst = fopen(buffer, "r");
			if (!fDst && (fDst = fopen(buffer, "w")))
			{
				char *buffer2 = (char *)malloc(1024);
				uint32_t bread;
				do
				{
					bread = fread(buffer2, 1, 1024, fSrc);
					fwrite(buffer2, 1, bread, fDst);
				} while (bread == 1024);
				free(buffer2);
			}
			fclose(fDst);
			fclose(fSrc);
		}

		/* Open the config file */
		if ((f = fopen(buffer, "r")))
		{
			buffer[pos] = '\0';
			settingsDir = strdup(buffer);
		}
	}

#ifndef WIN32
	uint32_t i;
	event_mutex = SDL_CreateMutex();
	event_cond = SDL_CreateCond();

	signal(SIGINT, signal_handler);
	signal(SIGILL, signal_handler);
	signal(SIGABRT, signal_handler);
	signal(SIGBUS, signal_handler);
	signal(SIGFPE, signal_handler);
	signal(SIGUSR1, signal_handler);
	signal(SIGSEGV, signal_handler);
	signal(SIGUSR2, signal_handler);
	signal(SIGPIPE, signal_handler);
	signal(SIGALRM, signal_handler);
	signal(SIGTERM, signal_handler);

	atexit(exit_func);
#endif
	if (!f)
		f = fopen("nfs2se.conf", "r");
	if (!f)
		fprintf(stderr, "Cannot open configuration file \"nfs2se.conf\"\n");
	else
	{
		BOOL canParseNextLine = true;
		char line[128];
		while (fgets(line, sizeof line, f))
		{
			uint32_t nPos = strlen(line) - 1;
			if (line[nPos] != '\n')
			{
				canParseNextLine = false;
				continue;
			}
			if (line[0] == '\0' || line[0] == ' ' || line[0] == '#')
				continue;
			if (!canParseNextLine)
			{
				canParseNextLine = true;
				continue;
			}
			line[nPos] = '\0';
			if (!strncasecmp("UseOnlyOneCPU=", line, 14))
				useOnlyOneCPU = !!atoi(line + 14);
			else if (!strncasecmp("StartInFullScreen=", line, 18))
				startInFullScreen = !!atoi(line + 18);
			else if (!strncasecmp("VSync=", line, 6))
				vSync = atoi(line + 6);
			else if (!strncasecmp("MSAA=", line, 5))
			{
				msaa = atoi(line + 5);
				if (msaa > 16 || (msaa & (msaa - 1)))
					msaa = 0;
			}
			else if (!strncasecmp("UseWindowSizeForFullScreen=", line, 27))
			{
				if (atoi(line + 27))
					fullScreenFlag = SDL_WINDOW_FULLSCREEN;
			}
			else if (!strncasecmp("WindowSize=", line, 11))
				sscanf(line + 11, "%dx%d", &winWidth, &winHeight);
			else if (!strncasecmp("KeepAspectRatio=", line, 16))
				sscanf(line + 16, "%d", &keepAspectRatio);
			else if (!strncasecmp("Joystick0AxisValueShift=", line, 24))
			{
				joystickAxisValueShift[0] = atoi(line + 24);
				if (joystickAxisValueShift[0] < 0 || joystickAxisValueShift[0] > 32767)
					joystickAxisValueShift[0] = 0;
			}
			else if (!strncasecmp("Joystick1AxisValueShift=", line, 24))
			{
				joystickAxisValueShift[1] = atoi(line + 24);
				if (joystickAxisValueShift[1] < 0 || joystickAxisValueShift[1] > 32767)
					joystickAxisValueShift[1] = 0;
			}
			else if (!strncasecmp("Joystick0Axes=", line, 14))
				sscanf(line + 14, "%d,%d,%d,%d:%d,%d,%d,%d", joystickAxes[0]+0, joystickAxes[0]+1, joystickAxes[0]+2, joystickAxes[0]+3, joystickAxes[0]+4, joystickAxes[0]+5, joystickAxes[0]+6, joystickAxes[0]+7);
			else if (!strncasecmp("Joystick1Axes=", line, 14))
				sscanf(line + 14, "%d,%d,%d,%d:%d,%d,%d,%d", joystickAxes[1]+0, joystickAxes[1]+1, joystickAxes[1]+2, joystickAxes[1]+3, joystickAxes[1]+4, joystickAxes[1]+5, joystickAxes[1]+6, joystickAxes[1]+7);
			else if (!strncasecmp("Joystick0Buttons=", line, 17))
				sscanf(line + 17, "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", joystickButtons[0]+0, joystickButtons[0]+1, joystickButtons[0]+2, joystickButtons[0]+3, joystickButtons[0]+4, joystickButtons[0]+5, joystickButtons[0]+6, joystickButtons[0]+7, joystickButtons[0]+8, joystickButtons[0]+9, joystickButtons[0]+10, joystickButtons[0]+11, joystickButtons[0]+12, joystickButtons[0]+13, joystickButtons[0]+14);
			else if (!strncasecmp("Joystick1Buttons=", line, 17))
				sscanf(line + 17, "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d", joystickButtons[1]+0, joystickButtons[1]+1, joystickButtons[1]+2, joystickButtons[1]+3, joystickButtons[1]+4, joystickButtons[1]+5, joystickButtons[1]+6, joystickButtons[1]+7, joystickButtons[1]+8, joystickButtons[1]+9, joystickButtons[1]+10, joystickButtons[1]+11, joystickButtons[1]+12, joystickButtons[1]+13, joystickButtons[1]+14);
			else if (!strncasecmp("UseSpringForceFeedbackEffect=", line, 29))
				useSpringForceFeedbackEffect = atoi(line + 29);
#ifdef WIN32
			else if (!strncasecmp("WindowsForceFeedbackDevice=", line, 27))
				windowsForceFeedbackDevice = atoi(line + 27);
#endif
			else if (!strncasecmp("LinearSoundInterpolation=", line, 25))
				linearSoundInterpolation = !!atoi(line + 25);
			else if (!strncasecmp("UseGlBleginGlEnd=", line, 17))
				useGlBleginGlEnd = !!atoi(line + 17);
			else if (!strncasecmp("Port1=", line, 6))
				PORT1 = atoi(line + 6);
			else if (!strncasecmp("Port2=", line, 6))
				PORT2 = atoi(line + 6);
			else if (!strncasecmp("Bcast=", line, 6))
			{
				uint32_t a, b, c, d;
				if (sscanf(line + 6, "%d.%d.%d.%d", &a, &b, &c, &d) && a <= 0xFF && b <= 0xFF && c <= 0xFF && d <= 0xFF)
					broadcast = d << 24 | c << 16 | b << 8 | a;
			}
#ifndef WIN32
			else if (!strncasecmp("LinuxCOM1=", line, 10))
				serialPort[0] = strdup(line + 10);
			else if (!strncasecmp("LinuxCOM2=", line, 10))
				serialPort[1] = strdup(line + 10);
			else if (!strncasecmp("LinuxCOM3=", line, 10))
				serialPort[2] = strdup(line + 10);
			else if (!strncasecmp("LinuxCOM4=", line, 10))
				serialPort[3] = strdup(line + 10);
#endif
		}
		fclose(f);
	}
	if (msaa)
	{
		SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, msaa == 1 ? 0 : 1);
		SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, msaa);
	}
#ifndef WIN32
	for (i = 0; i < 4; ++i)
	{
		if (!serialPort[i])
		{
			char tmp[11];
			sprintf(tmp, "/dev/ttyS%d", i);
			serialPort[i] = strdup(tmp);
		}
	}
#endif

	if (useOnlyOneCPU)
	{
#if defined WIN32
		SetProcessAffinityMask(GetCurrentProcess(), 1);
#elif !defined linux
		#warning "TODO: thread affinity"
#else
		cpu_set_t set;
		CPU_ZERO(&set);
		CPU_SET(0, &set);
		if (sched_setaffinity(0, sizeof set, &set))
			perror("sched_setaffinity");
#endif
	}

	checkGameDirs();
}

#ifdef SWAP_WINDOW_AND_GL_THREAD
REALIGN STDCALL void WrapperStartInThread(SDL_ThreadFunction mainCodeInSeparateThread)
{
	initializeSDL2();
	SDL_DetachThread(SDL_CreateThread(mainCodeInSeparateThread, NULL, NULL));
}
#endif

extern WindowProc wndProc;

REALIGN STDCALL SDL_Window *WrapperCreateWindow(WindowProc windowProc)
{
	static const uint32_t palette[8] = {0xFF000000, 0xFF000080, 0xFF0000FF, 0xFFC0C0C0, 0xFF00FFFF, 0xFFFFFFFF, 0x00000000, 0xFF008080};
	static const uint8_t compressed_icon[372] =
	{
		0x90, 0x00, 0x12, 0x22, 0x33, 0x83, 0x34, 0x86, 0x44, 0x45, 0x82, 0x55,
		0x51, 0x83, 0x00, 0x11, 0x83, 0x22, 0x24, 0x42, 0x01, 0x12, 0x82, 0x22,
		0x12, 0x44, 0x10, 0x82, 0x66, 0x60, 0x12, 0x83, 0x22, 0x24, 0x41, 0x01,
		0x84, 0x22, 0x44, 0x06, 0x82, 0x66, 0x60, 0x12, 0x83, 0x22, 0x24, 0x31,
		0x01, 0x84, 0x22, 0x43, 0x06, 0x82, 0x66, 0x60, 0x84, 0x22, 0x34, 0x20,
		0x02, 0x83, 0x22, 0x23, 0x42, 0x06, 0x82, 0x66, 0x60, 0x84, 0x22, 0x34,
		0x10, 0x02, 0x83, 0x22, 0x23, 0x41, 0x83, 0x66, 0x01, 0x84, 0x22, 0x44,
		0x10, 0x12, 0x83, 0x22, 0x24, 0x40, 0x83, 0x66, 0x01, 0x84, 0x22, 0x43,
		0x00, 0x12, 0x83, 0x22, 0x24, 0x20, 0x83, 0x66, 0x84, 0x00, 0x22, 0x42,
		0x88, 0x00, 0x66, 0x00, 0x73, 0x82, 0x55, 0x43, 0x70, 0x21, 0x00, 0x74,
		0x44, 0x45, 0x83, 0x55, 0x47, 0x60, 0x73, 0x84, 0x44, 0x53, 0x70, 0x00,
		0x74, 0x85, 0x44, 0x70, 0x07, 0x82, 0x44, 0x30, 0x00, 0x34, 0x44, 0x47,
		0x00, 0x34, 0x44, 0x84, 0x33, 0x06, 0x07, 0x44, 0x43, 0x82, 0x00, 0x07,
		0x82, 0x44, 0x07, 0x34, 0x44, 0x70, 0x83, 0x00, 0x66, 0x07, 0x34, 0x44,
		0x43, 0x37, 0x83, 0x00, 0x07, 0x82, 0x44, 0x84, 0x00, 0x06, 0x60, 0x73,
		0x34, 0x82, 0x44, 0x43, 0x70, 0x00, 0x07, 0x44, 0x45, 0x83, 0x55, 0x44,
		0x30, 0x66, 0x07, 0x77, 0x33, 0x82, 0x44, 0x43, 0x00, 0x03, 0x85, 0x44,
		0x43, 0x06, 0x84, 0x00, 0x07, 0x34, 0x44, 0x30, 0x73, 0x44, 0x43, 0x84,
		0x00, 0x66, 0x34, 0x44, 0x47, 0x82, 0x00, 0x03, 0x44, 0x30, 0x74, 0x44,
		0x40, 0x84, 0x00, 0x66, 0x74, 0x82, 0x44, 0x37, 0x77, 0x34, 0x44, 0x70,
		0x34, 0x85, 0x44, 0x43, 0x06, 0x07, 0x34, 0x84, 0x44, 0x43, 0x07, 0x34,
		0x85, 0x44, 0x30, 0x66, 0x60, 0x77, 0x34, 0x82, 0x44, 0x33, 0x70, 0x07,
		0x86, 0x33, 0x70, 0x82, 0x66, 0x85, 0x00, 0x01, 0x87, 0x00, 0x06, 0x82,
		0x66, 0x02, 0x84, 0x22, 0x42, 0x00, 0x84, 0x22, 0x24, 0x20, 0x83, 0x66,
		0x02, 0x84, 0x22, 0x42, 0x01, 0x84, 0x22, 0x24, 0x10, 0x82, 0x66, 0x60,
		0x12, 0x83, 0x22, 0x23, 0x41, 0x01, 0x84, 0x22, 0x34, 0x06, 0x82, 0x66,
		0x60, 0x84, 0x22, 0x23, 0x41, 0x02, 0x84, 0x22, 0x34, 0x06, 0x82, 0x66,
		0x60, 0x84, 0x22, 0x24, 0x30, 0x02, 0x84, 0x22, 0x43, 0x06, 0x82, 0x66,
		0x60, 0x84, 0x22, 0x24, 0x20, 0x02, 0x84, 0x22, 0x42, 0x06, 0x82, 0x66,
		0x01, 0x84, 0x22, 0x24, 0x10, 0x01, 0x84, 0x22, 0x41, 0x83, 0x00, 0x14,
		0x82, 0x54, 0x85, 0x44, 0x84, 0x43, 0x33, 0x82, 0x22, 0x20, 0x90, 0x00
	};

	uint32_t *icon, i, j;

	sdlWin = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, winWidth, winHeight, SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE | (startInFullScreen ? fullScreenFlag : 0));
	if (!sdlWin)
	{
		const char *error = SDL_GetError();
		int bufferSize = strlen(error) + 71;
		char *buffer = (char *)malloc(bufferSize);
		snprintf(buffer, bufferSize, "Cannot create window: %s\nCheck the OpenGL drivers and the game settings!", error);
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, buffer, NULL);
		free(buffer);
		exit(0);
	}

	icon = (uint32_t *)malloc(32 * 32 * 4);
	for (i = 0, j = 0; i < sizeof compressed_icon; ++i)
	{
		uint32_t c;
		if (compressed_icon[i] & 0x80)
			c = compressed_icon[i++] & 0x7F;
		else
			c = 1;
		while (c--)
		{
			icon[j++] = palette[compressed_icon[i] >> 4];
			icon[j++] = palette[compressed_icon[i] & 0x0F];
		}
	}
	SDL_Surface *icon_surface = SDL_CreateRGBSurfaceFrom(icon, 32, 32, 32, 128, 0x000000FF, 0x0000FF00, 0x00FF0000, 0xFF000000);
	SDL_SetWindowIcon(sdlWin, icon_surface);
	SDL_FreeSurface(icon_surface);

	free(icon);

	wndProc = windowProc;

	return sdlWin;
}

/* Wrapper for functions called from Assembly code for stack realignment */

#include <stdarg.h>
#include <time.h>

REALIGN int32_t SDL_NumJoysticks_wrap(void)
{
	return SDL_NumJoysticks();
}
REALIGN uint32_t SDL_GetTicks_wrap(void)
{
	return SDL_GetTicks();
}
REALIGN void SDL_Delay_wrap(uint32_t ms)
{
	SDL_Delay(ms);
}

REALIGN int32_t vsprintf_wrap(char *s, const char *fmt, va_list arg)
{
	return vsprintf(s, fmt, arg);
}
REALIGN int32_t fscanf_wrap(FILE *f, const char *fmt, ...)
{
	int ret;
	va_list arg;
	va_start(arg, fmt);
	ret = vfscanf(f, fmt, arg);
	va_end(arg);
	return ret;
}
REALIGN int32_t fclose_wrap(FILE *f)
{
	return fclose(f);
}
REALIGN void *calloc_wrap(size_t num, size_t size)
{
	return calloc(num, size);
}
REALIGN void *malloc_wrap(size_t num)
{
	return malloc(num);
}
REALIGN void free_wrap(void *ptr)
{
	free(ptr);
}
REALIGN time_t time_wrap(time_t *timer)
{
	return time(timer);
}
