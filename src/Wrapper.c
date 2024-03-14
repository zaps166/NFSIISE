// SPDX-License-Identifier: MIT

#include "Wrapper.h"
#include "Version"
#include <SDL2/SDL.h>
#include <signal.h>
#include <sys/stat.h>
#ifdef WIN32
	#include <windows.h>
#else
	#include <sched.h>
#endif

static const char title[] = "Need For Speed II SE";

typedef void (*ProcedureType)(MAYBE_THIS_SINGLE);
static ProcedureType atExitProcedures[10];
static uint32_t atExitProcedureCount;
REALIGN STDCALL void WrapperAtExit(ProcedureType proc)
{
	if (atExitProcedureCount < 10)
		atExitProcedures[atExitProcedureCount++] = proc;
}

uint32_t watchdogTimer(uint32_t interval, void *param)
{
	exit(0);
}

SDL_Window *sdlWin = NULL;
float dpr = 1.0f;

#ifdef OPENGL1X
void SetBrightness(float val)
{
	SDL_SetWindowBrightness(sdlWin, val);
}
#endif

static char *settingsDir = NULL;

#ifndef WIN32
static
#endif
BOOL useOnlyOneCPU = false;

#ifndef WIN32
char *serialPort[4] = {NULL};
SDL_mutex *event_mutex;
SDL_cond *event_cond;
#endif
void exit_func(void)
{
	SDL_TimerID timerID;
	uint32_t i;

#ifndef WIN32
	signal(SIGINT, SIG_DFL);
	signal(SIGTERM, SIG_DFL);
#endif

	for (i = 0; i < atExitProcedureCount; ++i)
	{
		timerID = SDL_AddTimer(2500, watchdogTimer, NULL);
#ifdef NFS_CPP
		extern void *main_game_thread;
		atExitProcedures[i](main_game_thread);
#else
		atExitProcedures[i]();
#endif
		SDL_RemoveTimer(timerID);
	}
	atExitProcedureCount = 0;

#ifndef WIN32
	for (i = 0; i < 4; ++i)
	{
		free(serialPort[i]);
		serialPort[i] = NULL;
	}
#endif

	i = 250;
	while (sdlWin && i--)
		SDL_Delay(10);

#if !defined(WIN32) && 0 // Disabled, because currently causes deadlock on Linux
	SDL_DestroyCond(event_cond);
	event_cond = NULL;
	SDL_DestroyMutex(event_mutex);
	event_mutex = NULL;
#endif

	free(settingsDir);
	settingsDir = NULL;
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
	struct stat st;
	uint32_t i;

	if (stat("gamedata", &st) != 0 || !S_ISDIR(st.st_mode) || stat("fedata/pc", &st) != 0 || !S_ISDIR(st.st_mode))
	{
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title,
			"Can't find \"gamedata\" and/or \"fedata\" directories!"
#ifndef WIN32
			"\nMake sure that all files and directories have small letters!"
#endif
			, NULL
		);
		exit(-1);
	}

	const char *const files[] = {
		"install.win",
		"text.eng",
		"text.fre",
		"text.ger",
		"text.ita",
		"text.spa",
		"text.swe",
	};
	for (i = 0; i < sizeof(files) / sizeof(*files); ++i)
	{
		if (stat(files[i], &st) != 0 || !S_ISREG(st.st_mode))
		{
			char text[32];
			snprintf(text, sizeof(text), "Missing %s file!", files[i]);
			SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, text, NULL);
			exit(-1);
		}
	}
}

static void signal_handler(int sig)
{
#ifndef WIN32
	if (sig == SIGPIPE)
		return;
#endif

	if (sig == SIGINT || sig == SIGTERM)
	{
		exit_func();
		exit(0);
		return;
	}

	extern BOOL contextError;
#ifndef OPENGL1X
	extern BOOL shaderError;
	extern BOOL framebufferError;
#endif // OPENGL1X
	if (contextError)
	{
#ifndef WIN32
		SDL_SetWindowFullscreen(sdlWin, SDL_FALSE);
#endif
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, "Can't create context!", NULL);
	}
#ifndef OPENGL1X
	else if (shaderError)
	{
#ifndef WIN32
		SDL_SetWindowFullscreen(sdlWin, SDL_FALSE);
#endif
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, "Error loading shaders, see console output!", NULL);
	}
	else if (framebufferError)
	{
#ifndef WIN32
		SDL_SetWindowFullscreen(sdlWin, SDL_FALSE);
#endif
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, "Can't create framebuffer!", NULL);
	}
#endif // OPENGL1X
	else
	{
		fprintf(stderr, "Application closed with a signal: %d\n", sig);
		fflush(stderr);
	}

	signal(sig, SIG_DFL);
	raise(sig);
}

static BOOL startInFullScreen = true;

int32_t joystickAxes[2][12] = {{0, 1, 2, 3, 4, 5, 0, 0, 0, 0, 0, 0}, {0, 1, 2, 3, 4, 5, 0, 0, 0, 0, 0, 0}};
int32_t initialWinWidth = 640, initialWinHeight = 480, winWidth, winHeight, vSync = 1;
int32_t joystickAxisValueShift[2] = {-1, -1}, joystickEscButton[2] = {-1, -1}, joystickResetButton[2] = {-1, -1}, joystickDPadButtons[2][4] = {{-1, -1, -1, -1}, {-1, -1, -1, -1}};
BOOL linearSoundInterpolation = false, keepAspectRatio = true, linearFiltering = true;
uint32_t fullScreenFlag = SDL_WINDOW_FULLSCREEN_DESKTOP, broadcast = 0xFFFFFFFF;
uint16_t PORT1 = 1030, PORT2 = 1029;
#ifndef OPENGL1X
BOOL fixedFramebufferSize = false;
BOOL framebufferLinearFiltering = true;
#endif

static void initializeSDL2()
{
#ifdef NFS_CPP
	extern const char *binaryGameVersion;
	#define binaryGameVersion (*binaryGameVersion)
#else
	extern const char binaryGameVersion;
#endif
	printf("%s\n  Wrapper v%s\n  Game    v%s\n  OpenGL  ", title, WRAPPER_VERSION, &binaryGameVersion);
#if defined(OPENGL1X)
	puts("1");
#elif defined(GLES2)
	puts("ES 2");
#else
	puts("2");
#endif
	fflush(stdout);

#ifdef WIN32
	SDL_SetHint(SDL_HINT_JOYSTICK_THREAD, "1");
#endif
#ifdef __ANDROID__
	SDL_SetHint(SDL_HINT_ORIENTATIONS, "LandscapeLeft");
	SDL_SetHint(SDL_HINT_ANDROID_TRAP_BACK_BUTTON, "1");
	SDL_SetHint(SDL_HINT_ENABLE_SCREEN_KEYBOARD, "0");
	SDL_SetHint(SDL_HINT_ANDROID_BLOCK_ON_PAUSE, "0");
	SDL_SetHint(SDL_HINT_ANDROID_BLOCK_ON_PAUSE_PAUSEAUDIO, "0");
#endif
	SDL_SetHint(SDL_HINT_MOUSE_TOUCH_EVENTS, "0");
	SDL_SetHint(SDL_HINT_TOUCH_MOUSE_EVENTS, "0");

	if (SDL_Init(SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS) < 0)
		fprintf(stderr, "SDL init failed: %s\n", SDL_GetError());
}

#ifdef SWAP_WINDOW_AND_GL_THREAD
REALIGN
#endif
void WrapperInit(void)
{
#ifndef SWAP_WINDOW_AND_GL_THREAD
	initializeSDL2();
#endif

#ifdef OPENGL1X
	uint32_t msaa = 0;
#endif
	FILE *f = NULL;

	SDL_JoystickEventState(SDL_IGNORE);
	SDL_ShowCursor(false);

#ifdef __ANDROID__
	if (!SDL_AndroidRequestPermission("android.permission.READ_EXTERNAL_STORAGE"))
	{
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, "No permissions to read the external storage.", NULL);
		exit(-1);
	}
	chdir("/sdcard/NFSIISE");
#endif

#if defined(WIN32)
	const char *homeDir = getenv("AppData");
#elif defined(__ANDROID__)
	const char *homeDir = SDL_AndroidGetInternalStoragePath();
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
		char *buffer = malloc(strlen(homeDir) + 100);
		uint32_t pos, i;

		/* Creating ~/.nfs2se directory and subdirectories */
		strcpy(buffer, homeDir);
#ifdef __APPLE__
		strcat(buffer, "/Library/Application Support/nfs2se/");
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

#ifdef __ANDROID__
		buffer[pos] = '\0';
		settingsDir = buffer;
#else
		/* Checking for nfs2se.conf and copying it at first time to home dir */
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
			settingsDir = buffer;
		}
		else
		{
			free(buffer);
		}
#endif
	}

#ifndef WIN32
	event_mutex = SDL_CreateMutex();
	event_cond = SDL_CreateCond();

	signal(SIGILL, signal_handler);
	signal(SIGBUS, signal_handler);
	signal(SIGFPE, signal_handler);
	signal(SIGUSR1, signal_handler);
	signal(SIGSEGV, signal_handler);
	signal(SIGUSR2, signal_handler);
	signal(SIGPIPE, signal_handler);
	signal(SIGALRM, signal_handler);
#endif

	signal(SIGINT, signal_handler);
	signal(SIGABRT, signal_handler);
	signal(SIGTERM, signal_handler);

	if (!f)
		f = fopen("nfs2se.conf", "r");
	if (!f)
	{
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_WARNING, title, "Cannot open configuration file \"nfs2se.conf\"\n", NULL);
	}
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
#ifdef OPENGL1X
			else if (!strncasecmp("MSAA=", line, 5))
			{
				msaa = atoi(line + 5);
				if (msaa > 16 || (msaa & (msaa - 1)))
					msaa = 0;
			}
#endif
			else if (!strncasecmp("FixedRenderingSize=", line, 19))
			{
				int val = atoi(line + 19);
				if (val == 1 || val == 2)
				{
#ifdef OPENGL1X
					fullScreenFlag = SDL_WINDOW_FULLSCREEN;
#else
					fixedFramebufferSize = true;
					if (val == 2)
						framebufferLinearFiltering = false;
#endif
				}
			}
			else if (!strncasecmp("WindowSize=", line, 11))
				sscanf(line + 11, "%dx%d", &initialWinWidth, &initialWinHeight);
			else if (!strncasecmp("KeepAspectRatio=", line, 16))
				sscanf(line + 16, "%d", &keepAspectRatio);
			else if (!strncasecmp("LinearTextureFiltering=", line, 23))
				sscanf(line + 23, "%d", &linearFiltering);
			else if (!strncasecmp("Joystick0AxisValueShift=", line, 24))
				joystickAxisValueShift[0] = atoi(line + 24);
			else if (!strncasecmp("Joystick1AxisValueShift=", line, 24))
				joystickAxisValueShift[1] = atoi(line + 24);
			else if (!strncasecmp("Joystick0Axes2=", line, 15))
				sscanf(line + 15, "%d,%d,%d,%d,%d,%d:%d,%d,%d,%d,%d,%d", joystickAxes[0]+0, joystickAxes[0]+1, joystickAxes[0]+2, joystickAxes[0]+3, joystickAxes[0]+4, joystickAxes[0]+5, joystickAxes[0]+6, joystickAxes[0]+7, joystickAxes[0]+8, joystickAxes[0]+9, joystickAxes[0]+10, joystickAxes[0]+11);
			else if (!strncasecmp("Joystick1Axes2=", line, 15))
				sscanf(line + 15, "%d,%d,%d,%d,%d,%d:%d,%d,%d,%d,%d,%d", joystickAxes[1]+0, joystickAxes[1]+1, joystickAxes[1]+2, joystickAxes[1]+3, joystickAxes[1]+4, joystickAxes[1]+5, joystickAxes[1]+6, joystickAxes[1]+7, joystickAxes[1]+8, joystickAxes[1]+9, joystickAxes[1]+10, joystickAxes[1]+11);
			else if (!strncasecmp("Joystick0EscButton=", line, 19))
				sscanf(line + 19, "%d", &joystickEscButton[0]);
			else if (!strncasecmp("Joystick1EscButton=", line, 19))
				sscanf(line + 19, "%d", &joystickEscButton[1]);
			else if (!strncasecmp("Joystick0ResetButton=", line, 21))
				sscanf(line + 21, "%d", &joystickResetButton[0]);
			else if (!strncasecmp("Joystick1ResetButton=", line, 21))
				sscanf(line + 21, "%d", &joystickResetButton[1]);
			else if (!strncasecmp("Joystick0DPadButtons=", line, 21))
				sscanf(line + 21, "%d,%d,%d,%d", &joystickDPadButtons[0][0], &joystickDPadButtons[0][1], &joystickDPadButtons[0][2], &joystickDPadButtons[0][3]);
			else if (!strncasecmp("Joystick1DPadButtons=", line, 21))
				sscanf(line + 21, "%d,%d,%d,%d", &joystickDPadButtons[1][0], &joystickDPadButtons[1][1], &joystickDPadButtons[1][2], &joystickDPadButtons[1][3]);
			else if (!strncasecmp("LinearSoundInterpolation=", line, 25))
				linearSoundInterpolation = !!atoi(line + 25);
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
#ifdef __ANDROID__
			else if (!strncasecmp("AccelerometerAsJoystick=", line, 24))
				SDL_SetHint(SDL_HINT_ACCELEROMETER_AS_JOYSTICK, line + 24);
#endif
		}
		fclose(f);
	}

#ifndef OPENGL1X
# ifdef GLES2
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_ES);
# endif
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
	SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
#else
	if (msaa)
	{
		SDL_GL_SetAttribute(SDL_GL_MULTISAMPLEBUFFERS, msaa == 1 ? 0 : 1);
		SDL_GL_SetAttribute(SDL_GL_MULTISAMPLESAMPLES, msaa);
	}
#endif
#ifndef WIN32
	uint32_t i;
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
		SetThreadAffinityMask(GetCurrentThread(), 1);
#elif !defined(linux)
		#warning "TODO: thread affinity"
#else
		cpu_set_t set;
		CPU_ZERO(&set);
		CPU_SET(0, &set);
		if (sched_setaffinity(0, sizeof set, &set))
			perror("sched_setaffinity");
#endif
	}
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
#ifndef __ANDROID__
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
#endif

	checkGameDirs();

	int windowFlags = SDL_WINDOW_OPENGL | SDL_WINDOW_ALLOW_HIGHDPI | (startInFullScreen ? fullScreenFlag : 0);
	if (fullScreenFlag == SDL_WINDOW_FULLSCREEN_DESKTOP)
		windowFlags |= SDL_WINDOW_RESIZABLE;
	sdlWin = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, initialWinWidth, initialWinHeight, windowFlags);
	if (!sdlWin)
	{
		const char errorText[] = "Cannot create window: %s\nCheck the OpenGL drivers and the game settings!";
		const char *error = SDL_GetError();
		size_t bufferSize = strlen(error) + sizeof(errorText) - 2;
		char *buffer = (char *)malloc(bufferSize);
		snprintf(buffer, bufferSize, errorText, error);
		SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, buffer, NULL);
		free(buffer);
		exit(-1);
	}

	SDL_GetWindowSize(sdlWin, &winWidth, &winHeight);

#ifndef __ANDROID__
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
#endif

	wndProc = windowProc;

	return sdlWin;
}

REALIGN int32_t SDL_NumJoysticks_wrap(void)
{
	return 2;
}

#ifdef NFS_CPP
int main(int argc, char *argv[])
{
	void nfs2seEntrypoint();
	nfs2seEntrypoint();
	return 0;
}
#endif

/* Wrapper for functions called from Assembly code for stack realignment */

#include <stdarg.h>
#include <time.h>

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
