#include "Wrapper.h"
#include <SDL2/SDL.h>
#ifdef WIN32
	#include <windows.h>
#endif

#if defined(SDL_VIDEO_DRIVER_X11) && defined(SDL_VIDEO_DRIVER_X11_DYNAMIC_XVIDMODE)
	#include <SDL2/SDL_loadso.h>
	#include <SDL2/SDL_syswm.h>
	typedef struct { float red, green, blue; } XF86VidModeGamma;
	typedef BOOL ( *_XF86VidModeGetGamma )( Display *, int, XF86VidModeGamma * );
	typedef BOOL ( *_XF86VidModeSetGamma )( Display *, int, XF86VidModeGamma * );
	#define USE_X11_GAMMA
#endif

typedef void ( *ProcedureType )( void );
static ProcedureType atExitProcedures[ 10 ];
static uint32_t atExitProcedureCount;
void WrapperAtExit( ProcedureType proc )
{
	uint32_t i;
	for ( i = 0 ; i < atExitProcedureCount ; ++i )
		if ( proc == atExitProcedures[ i ] )
			return;
	if ( atExitProcedureCount < 10 )
		atExitProcedures[ atExitProcedureCount++ ] = proc;
}

uint32_t watchdogTimer( uint32_t interval, void *param )
{
#ifndef WIN32
	exit( 0 );
#else
	ExitProcess( 0 );
#endif
}

SDL_Window *sdl_win = NULL;

void SetBrightness( float val )
{
	/* This function exists because SDL2 uses function for brightness which is not supported by opensource X11 drivers */
	/* val < 0.0f tries to restore the brightness, less than -1.0 doesn't affect SDL function */
#ifdef USE_X11_GAMMA
	static BOOL firstCall = true;
	SDL_SysWMinfo sysInfo;
	SDL_VERSION( &sysInfo.version );
	if ( SDL_GetWindowWMInfo( sdl_win, &sysInfo ) && sysInfo.subsystem == SDL_SYSWM_X11 )
	{
		static XF86VidModeGamma gammaToRestore = { -1.0f, -1.0f, -1.0f };
		static _XF86VidModeGetGamma XF86VidModeGetGamma;
		static _XF86VidModeSetGamma XF86VidModeSetGamma;
		if ( firstCall && ( !XF86VidModeGetGamma || !XF86VidModeSetGamma ) )
		{
			void *Xxf86vm = SDL_LoadObject( SDL_VIDEO_DRIVER_X11_DYNAMIC_XVIDMODE );
			if ( Xxf86vm )
			{
				XF86VidModeGetGamma = SDL_LoadFunction( Xxf86vm, "XF86VidModeGetGamma" );
				XF86VidModeSetGamma = SDL_LoadFunction( Xxf86vm, "XF86VidModeSetGamma" );
			}
		}
		firstCall = false;
		if ( XF86VidModeGetGamma && XF86VidModeSetGamma )
		{
			int screen = SDL_GetWindowDisplayIndex( sdl_win );
			if ( screen < 0 )
				screen = 1;
			if ( gammaToRestore.red == -1.0f && gammaToRestore.green == -1.0f && gammaToRestore.blue == -1.0f )
				XF86VidModeGetGamma( sysInfo.info.x11.display, screen, &gammaToRestore ); //get brightness at first attempt
			if ( val < 0.0f )
			{
				if ( gammaToRestore.red >= 0.0f && gammaToRestore.green >= 0.0f && gammaToRestore.blue >= 0.0f && XF86VidModeSetGamma( sysInfo.info.x11.display, screen, &gammaToRestore ) ) //restore brightness
					return;
				else
					val = 1.0f;
			}
			if ( val >= 0.0f )
			{
				XF86VidModeGamma gamma = { val, val, val };
				if ( XF86VidModeSetGamma( sysInfo.info.x11.display, screen, &gamma ) ) //set brightness
					return;
			}
		}
	}
#endif
	if ( val >= -1.0f )
		SDL_SetWindowBrightness( sdl_win, val < 0.0f ? 1.0f : val );
}

#ifndef WIN32
char *serialPort[ 4 ] = { NULL };
char *settingsDir = NULL;
SDL_mutex *event_mutex;
SDL_cond *event_cond;
static
#endif
void exit_func( void )
{
	SDL_TimerID timerID;
	uint32_t i;
	for ( i = 0 ; i < atExitProcedureCount ; ++i )
	{
		timerID = SDL_AddTimer( 2500, watchdogTimer, NULL );
		atExitProcedures[ i ]();
		SDL_RemoveTimer( timerID );
	}
#ifndef WIN32
	for ( i = 0 ; i < 4 ; ++i )
		free( serialPort[ i ] );
#endif
	i = 250;
	while ( sdl_win && i-- )
		SDL_Delay( 10 );
#ifndef WIN32
	SDL_DestroyCond( event_cond );
	event_cond = NULL;
	SDL_DestroyMutex( event_mutex );
	event_mutex = NULL;
	free( settingsDir );
#endif
}

#ifndef WIN32
#include <sys/stat.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <sched.h>

static void signal_handler( int sig )
{
	static char errStr[ 40 ];
	if ( sig == SIGINT )
	{
		exit( 0 );
		return;
	}
	if ( sig == SIGPIPE )
		return;
	snprintf( errStr, sizeof errStr, "Application closed with a signal: %d", sig );
	fprintf( stderr, "%s\n", errStr );
	SetBrightness( -1.0f );
	SDL_SetWindowFullscreen( sdl_win, SDL_FALSE );
	SDL_ShowSimpleMessageBox( 0, "Probably crash!", errStr, NULL );
	raise( SIGKILL );
}
#endif

static BOOL startAtFullScreen = false;

uint32_t joystickAxes[ 2 ][ 8 ] = { { 0, 1, 2, 3, 0, 0, 0, 0 }, { 0, 1, 2, 3, 0, 0, 0, 0 } };
int32_t win_width = 640, win_height = 480, joystickAxisValueShift[ 2 ] = { 0 }, mouseJoySensitivity = 20, VSync = 1;
uint32_t joystickButtons[ 2 ][ 15 ] = { { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 }, { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 } };
BOOL mouseAsJoystick = false, linearSoundInterpolation = false, useGlBleginGlEnd = false;
uint32_t fullscreenFlag = SDL_WINDOW_FULLSCREEN_DESKTOP, Bcast = 0xFFFFFFFF;
uint16_t PORT1 = 1030, PORT2 = 1029;

void WrapperInit( void )
{
	BOOL useOnlyOneCPU = true;
	uint32_t msaa = 0;
	FILE *f = NULL;

	SDL_Init( ( SDL_INIT_EVERYTHING | SDL_INIT_NOPARACHUTE ) & ~SDL_INIT_GAMECONTROLLER );
	SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 );

#ifndef WIN32
	const char *homeDir = getenv( "HOME" );
	if ( homeDir && *homeDir )
	{
		char buffer[ 256 ];
		struct stat st;
		int pos;

		/* Creating ~/.nfs2se directory and subdirectories */

		strcpy( buffer, homeDir );
		strcat( buffer, "/.nfs2se/" );
		mkdir( buffer, 0755 );
		pos = strlen( buffer );

		strcpy( buffer + pos, "config" );
		mkdir( buffer, 0755 );
		if ( stat( buffer, &st ) == 0 )
		{
			strcpy( buffer + pos, "save" );
			mkdir( buffer, 0755 );
			if ( stat( buffer, &st ) == 0 )
			{
				strcpy( buffer + pos, "tmptrk" );
				mkdir( buffer, 0755 );
				if ( stat( buffer, &st ) == 0 )
				{
					strcpy( buffer + pos, "stats" );
					mkdir( buffer, 0755 );
					if ( stat( buffer, &st ) == 0 )
					{
						/* Checking for nfs2se.conf and copying it at first tme to home dir */
						strcpy( buffer + pos, "nfs2se.conf" );
						if ( stat( buffer, &st ) == -1 && stat( "nfs2se.conf", &st ) == 0 )
						{
							int fd1 = open( "nfs2se.conf", O_RDONLY );
							if ( fd1 > 0 )
							{
								int fd2 = open( buffer, O_CREAT | O_WRONLY | O_TRUNC, 0644 );
								if ( fd2 > 0 )
								{
									char *buffer2 = ( char * )malloc( st.st_size );
									read( fd1, buffer2, st.st_size );
									write( fd2, buffer2, st.st_size );
									free( buffer2 );
									close( fd2 );
								}
								close( fd1 );
							}
						}
						if ( stat( buffer, &st ) == 0 )
						{
							f = fopen( buffer, "r" );
							buffer[ pos ] = '\0';
							settingsDir = strdup( buffer );
						}
					}
				}
			}
		}
	}

	int32_t i;
	event_mutex = SDL_CreateMutex();
	event_cond = SDL_CreateCond();
	for ( i = SIGHUP ; i <= SIGSTKFLT ; ++i )
		if ( i != SIGKILL && i != SIGTRAP )
			signal( i, signal_handler );
	atexit( exit_func );
#endif
	if ( !f )
		f = fopen( "nfs2se.conf", "r" );
	if ( !f )
		fprintf( stderr, "Cannot open configuration file \"nfs2se.conf\"\n" );
	else
	{
		BOOL canParseNextLine = true;
		char line[ 128 ];
		while ( fgets( line, sizeof line, f ) )
		{
			uint32_t nPos = strlen( line ) - 1;
			if ( line[ nPos ] != '\n' )
			{
				canParseNextLine = false;
				continue;
			}
			if ( line[ 0 ] == '\0' || line[ 0 ] == ' ' || line[ 0 ] == '#' )
				continue;
			if ( !canParseNextLine )
			{
				canParseNextLine = true;
				continue;
			}
			line[ nPos ] = '\0';
			if ( !strncasecmp( "UseOnlyOneCPU=", line, 14 ) )
				useOnlyOneCPU = !!atoi( line + 14 );
			else if ( !strncasecmp( "StartAtFullScreen=", line, 18 ) )
				startAtFullScreen = !!atoi( line + 18 );
			else if ( !strncasecmp( "VSync=", line, 6 ) )
			{
				VSync = atoi( line + 6 );
				if ( VSync > 1 )
					VSync = 1;
			}
			else if ( !strncasecmp( "MSAA=", line, 5 ) )
			{
				msaa = atoi( line + 5 );
				if ( msaa > 16 || ( msaa & ( msaa - 1 ) ) )
					msaa = 0;
			}
			else if ( !strncasecmp( "UseWindowSizeForFullscreen=", line, 27 ) )
			{
				if ( atoi( line + 27 ) )
					fullscreenFlag = SDL_WINDOW_FULLSCREEN;
			}
			else if ( !strncasecmp( "WindowSize=", line, 11 ) )
				sscanf( line + 11, "%dx%d", &win_width, &win_height );
			else if ( !strncasecmp( "MouseAsJoystick=", line, 16 ) )
				mouseAsJoystick = !!atoi( line + 16 );
			else if ( !strncasecmp( "MouseJoySensitivity=", line, 20 ) )
			{
				mouseJoySensitivity = atoi( line + 20 );
				if ( mouseJoySensitivity < 1 )
					mouseJoySensitivity = 1;
				else if ( mouseJoySensitivity > 100 )
					mouseJoySensitivity = 100;
			}
			else if ( !strncasecmp( "Joystick0AxisValueShift=", line, 24 ) )
			{
				joystickAxisValueShift[ 0 ] = atoi( line + 24 );
				if ( joystickAxisValueShift[ 0 ] < 0 || joystickAxisValueShift[ 0 ] > 32767 )
					joystickAxisValueShift[ 0 ] = 0;
			}
			else if ( !strncasecmp( "Joystick1AxisValueShift=", line, 24 ) )
			{
				joystickAxisValueShift[ 1 ] = atoi( line + 24 );
				if ( joystickAxisValueShift[ 1 ] < 0 || joystickAxisValueShift[ 1 ] > 32767 )
					joystickAxisValueShift[ 1 ] = 0;
			}
			else if ( !strncasecmp( "Joystick0Axes=", line, 14 ) )
				sscanf( line + 14, "%u,%u,%u,%u:%u,%u,%u,%u", joystickAxes[ 0 ], joystickAxes[ 0 ]+1, joystickAxes[ 0 ]+2, joystickAxes[ 0 ]+3, joystickAxes[ 0 ]+4, joystickAxes[ 0 ]+5, joystickAxes[ 0 ]+6, joystickAxes[ 0 ]+7 );
			else if ( !strncasecmp( "Joystick1Axes=", line, 14 ) )
				sscanf( line + 14, "%u,%u,%u,%u:%u,%u,%u,%u", joystickAxes[ 1 ], joystickAxes[ 1 ]+1, joystickAxes[ 1 ]+2, joystickAxes[ 1 ]+3, joystickAxes[ 1 ]+4, joystickAxes[ 1 ]+5, joystickAxes[ 1 ]+6, joystickAxes[ 1 ]+7 );
			else if ( !strncasecmp( "Joystick0Buttons=", line, 17 ) )
				sscanf( line + 17, "%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u", joystickButtons[ 0 ], joystickButtons[ 0 ]+1, joystickButtons[ 0 ]+2, joystickButtons[ 0 ]+3, joystickButtons[ 0 ]+4,
																										joystickButtons[ 0 ]+5, joystickButtons[ 0 ]+6, joystickButtons[ 0 ]+7, joystickButtons[ 0 ]+8, joystickButtons[ 0 ]+9,
																										joystickButtons[ 0 ]+10, joystickButtons[ 0 ]+11, joystickButtons[ 0 ]+12, joystickButtons[ 0 ]+13, joystickButtons[ 0 ]+14 );
			else if ( !strncasecmp( "Joystick1Buttons=", line, 17 ) )
				sscanf( line + 17, "%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u,%u", joystickButtons[ 1 ], joystickButtons[ 1 ]+1, joystickButtons[ 1 ]+2, joystickButtons[ 1 ]+3, joystickButtons[ 1 ]+4,
																										joystickButtons[ 1 ]+5, joystickButtons[ 1 ]+6, joystickButtons[ 1 ]+7, joystickButtons[ 1 ]+8, joystickButtons[ 1 ]+9,
																										joystickButtons[ 1 ]+10, joystickButtons[ 1 ]+11, joystickButtons[ 1 ]+12, joystickButtons[ 1 ]+13, joystickButtons[ 1 ]+14 );
			else if ( !strncasecmp( "LinearSoundInterpolation=", line, 25 ) )
				linearSoundInterpolation = !!atoi( line + 25 );
			else if ( !strncasecmp( "UseGlBleginGlEnd=", line, 17 ) )
				useGlBleginGlEnd = !!atoi( line + 17 );
			else if ( !strncasecmp( "Port1=", line, 6 ) )
				PORT1 = atoi( line + 6 );
			else if ( !strncasecmp( "Port2=", line, 6 ) )
				PORT2 = atoi( line + 6 );
			else if ( !strncasecmp( "Bcast=", line, 6 ) )
			{
				uint32_t a, b, c, d;
				if ( sscanf( line + 6, "%d.%d.%d.%d", &a, &b, &c, &d ) && a <= 0xFF && b <= 0xFF && c <= 0xFF && d <= 0xFF )
					Bcast = d << 24 | c << 16 | b << 8 | a;
			}
#ifndef WIN32
			else if ( !strncasecmp( "LinuxCOM1=", line, 10 ) )
				serialPort[ 0 ] = strdup( line + 10 );
			else if ( !strncasecmp( "LinuxCOM2=", line, 10 ) )
				serialPort[ 1 ] = strdup( line + 10 );
			else if ( !strncasecmp( "LinuxCOM3=", line, 10 ) )
				serialPort[ 2 ] = strdup( line + 10 );
			else if ( !strncasecmp( "LinuxCOM4=", line, 10 ) )
				serialPort[ 3 ] = strdup( line + 10 );
#endif
		}
		fclose( f );
	}
	if ( msaa )
	{
		SDL_GL_SetAttribute( SDL_GL_MULTISAMPLEBUFFERS, msaa == 1 ? 0 : 1 );
		SDL_GL_SetAttribute( SDL_GL_MULTISAMPLESAMPLES, msaa );
	}
#ifndef WIN32
	for ( i = 0 ; i < 4 ; ++i )
	{
		if ( !serialPort[ i ] )
		{
			char tmp[ 11 ];
			sprintf( tmp, "/dev/ttyS%d", i );
			serialPort[ i ] = strdup( tmp );
		}
	}
#endif

	if ( useOnlyOneCPU )
#ifdef WIN32
		SetProcessAffinityMask( GetCurrentProcess(), 1 );
#else
	{
		cpu_set_t set;
		CPU_ZERO( &set );
		CPU_SET( 0, &set );
		if ( sched_setaffinity( 0, sizeof set, &set ) )
			perror( "sched_setaffinity" );
	}
#endif
}

extern WindowProc wndProc;

SDL_Window *WrapperCreateWindow( WindowProc windowProc )
{
	static const char title[] = "The Need For Speed 2";
	static const uint32_t palette[ 8 ] = { 0xFF000000, 0xFF000080, 0xFF0000FF, 0xFFC0C0C0, 0xFF00FFFF, 0xFFFFFFFF, 0x00000000, 0xFF008080 };
	static const uint8_t compressed_icon[ 372 ] =
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

	sdl_win = SDL_CreateWindow( title, SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, win_width, win_height, SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE | ( startAtFullScreen ? fullscreenFlag : 0 ) );
	if ( !sdl_win )
	{
		SDL_ShowSimpleMessageBox( SDL_MESSAGEBOX_ERROR, title, "Cannot create window, check OpenGL installation and game settings.", NULL );
		exit( 0 );
	}

	if ( startAtFullScreen )
		SDL_SetRelativeMouseMode( SDL_TRUE );

	icon = ( uint32_t * )malloc( 32 * 32 * 4 );
	for ( i = 0, j = 0 ; i < sizeof compressed_icon ; ++i )
	{
		uint32_t c;
		if ( compressed_icon[ i ] & 0x80 )
			c = compressed_icon[ i++ ] & 0x7F;
		else
			c = 1;
		while ( c-- )
		{
			icon[ j++ ] = palette[ compressed_icon[ i ] >> 4 ];
			icon[ j++ ] = palette[ compressed_icon[ i ] & 0x0F ];
		}
	}
	SDL_Surface *icon_surface = SDL_CreateRGBSurfaceFrom( icon, 32, 32, 32, 128, 0x000000FF, 0x0000FF00, 0x00FF0000, 0xFF000000 );
	SDL_SetWindowIcon( sdl_win, icon_surface );
	SDL_FreeSurface( icon_surface );

	free( icon );

	wndProc = windowProc;

	return sdl_win;
}