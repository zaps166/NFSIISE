/*
	MIT License

	Copyright (c) 2014-2017 Błażej Szczygieł

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

#include "Kernel32.h"

#include <SDL2/SDL_timer.h>

#ifdef WIN32
	void exit_func();
#else
	#define ERROR_IO_PENDING 0x3E5
	#define WAIT_TIMEOUT 0x102
	#include <sys/stat.h>
	#include <termios.h>
	#include <unistd.h>
	#include <fcntl.h>
	#include <errno.h>

	#ifdef __ANDROID__
		#include <sys/ioctl.h>
		#define tcdrain(fd) \
			ioctl((fd), TCSBRK, 1);
	#endif
#endif

#ifdef WIN32

REALIGN STDCALL void *CreateThread_wrap(void *threadAttributes, uint32_t stackSize, LPTHREAD_START_ROUTINE startAddress, void *parameter, uint32_t creationFlags, uint32_t *threadId)
{
	return CreateThread(threadAttributes, stackSize, startAddress, parameter, creationFlags, (DWORD *)threadId);
}
REALIGN STDCALL uint32_t ResumeThread_wrap(HANDLE hThread)
{
	return ResumeThread(hThread);
}
REALIGN STDCALL BOOL SetThreadPriority_wrap(HANDLE hThread, int priority)
{
	return SetThreadPriority(hThread, priority);
}
REALIGN STDCALL uint32_t GetCurrentThreadId_wrap(void)
{
	return GetCurrentThreadId();
}
REALIGN STDCALL void *GetCurrentThread_wrap(void)
{
	return GetCurrentThread();
}
REALIGN STDCALL BOOL TerminateThread_wrap(HANDLE hThread, uint32_t exitCode)
{
	return TerminateThread(hThread, exitCode);
}
REALIGN STDCALL void InitializeCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	InitializeCriticalSection(criticalSection);
}
REALIGN STDCALL void EnterCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	EnterCriticalSection(criticalSection);
}
REALIGN STDCALL void LeaveCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	LeaveCriticalSection(criticalSection);
}
REALIGN STDCALL void DeleteCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	DeleteCriticalSection(criticalSection);
}
REALIGN STDCALL void GlobalMemoryStatus_wrap(MEMORYSTATUS *memoryStatus)
{
	GlobalMemoryStatus(memoryStatus);
}
REALIGN STDCALL void ExitProcess_wrap(uint32_t exitCode)
{
	exit_func();
	ExitProcess(exitCode);
}
REALIGN STDCALL uint32_t GetLastError_wrap(void)
{
	return GetLastError();
}
REALIGN STDCALL HANDLE CreateFileA_wrap(const char *fileName, uint32_t desiredAccess, uint32_t shareMode, SECURITY_ATTRIBUTES *securityAttributes, uint32_t creationDisposition, uint32_t flagsAndAttributes, void *templateFile)
{
	char *tmpFileName;
	HANDLE handle;
	if (!strncasecmp(fileName, "\\\\.\\com", 7))
		tmpFileName = strdup(fileName);
	else
		tmpFileName = convertFilePath(fileName, false);
	handle = CreateFileA(tmpFileName, desiredAccess, shareMode, securityAttributes, creationDisposition, flagsAndAttributes, templateFile);
	free(tmpFileName);
	return handle;
}
REALIGN STDCALL HANDLE CreateFileMappingA_wrap(HANDLE hFile, SECURITY_ATTRIBUTES *fileMappingAttributes, uint32_t flProtect, uint32_t dwMaximumSizeHigh, uint32_t dwMaximumSizeLow, const char *lpName)
{
	return CreateFileMappingA(hFile, fileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName);
}
REALIGN STDCALL void *MapViewOfFile_wrap(HANDLE fMapping, uint32_t desiredAccess, uint32_t dwFileOffsetHigh, uint32_t dwFileOffsetLow, uint32_t dwNumberOfBytesToMap)
{
	return MapViewOfFile(fMapping, desiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap);
}
REALIGN STDCALL BOOL UnmapViewOfFile_wrap(const void *lpBaseAddress)
{
	return UnmapViewOfFile(lpBaseAddress);
}
REALIGN STDCALL BOOL FlushFileBuffers_wrap(HANDLE hFile)
{
	return FlushFileBuffers(hFile);
}
REALIGN STDCALL BOOL GetOverlappedResult_wrap(HANDLE hFile, OVERLAPPED *overlapped, uint32_t *lpNumberOfBytesTransferred, BOOL bWait)
{
	return GetOverlappedResult(hFile, overlapped, (DWORD *)lpNumberOfBytesTransferred, bWait);
}
REALIGN STDCALL uint32_t GetFileSize_wrap(HANDLE hFile, uint32_t *lpFileSizeHigh)
{
	return GetFileSize(hFile, (DWORD *)lpFileSizeHigh);
}
REALIGN STDCALL BOOL SetEndOfFile_wrap(HANDLE hFile)
{
	return SetEndOfFile(hFile);
}
REALIGN STDCALL uint32_t SetFilePointer_wrap(HANDLE hFile, uint32_t distanceToMove, uint32_t *distanceToMoveHigh, uint32_t moveMethod)
{
	return SetFilePointer(hFile, distanceToMove, (LONG *)distanceToMoveHigh, moveMethod);
}
REALIGN STDCALL BOOL WriteFile_wrap(HANDLE hFile, const void *buffer, uint32_t numberOfBytesToWrite, uint32_t *numberOfBytesWritten, OVERLAPPED *overlapped)
{
	return WriteFile(hFile, buffer, numberOfBytesToWrite, (DWORD *)numberOfBytesWritten, overlapped);
}
REALIGN STDCALL BOOL ReadFile_wrap(HANDLE hFile, void *buffer, uint32_t numberOfBytesToRead, uint32_t *numberOfBytesRead, OVERLAPPED *overlapped)
{
	return ReadFile(hFile, buffer, numberOfBytesToRead, (DWORD *)numberOfBytesRead, overlapped);
}
REALIGN STDCALL BOOL GetCommState_wrap(HANDLE hFile, DCB *dcb)
{
	return GetCommState(hFile, dcb);
}
REALIGN STDCALL BOOL PurgeComm_wrap(HANDLE hFile, uint32_t dwFlags)
{
	return PurgeComm(hFile, dwFlags);
}
REALIGN STDCALL BOOL SetCommState_wrap(HANDLE hFile, DCB *dcb)
{
	return SetCommState(hFile, dcb);
}
REALIGN STDCALL BOOL SetCommTimeouts_wrap(HANDLE hFile, COMMTIMEOUTS *commTimeouts)
{
	return SetCommTimeouts(hFile, commTimeouts);
}
REALIGN STDCALL BOOL DeleteFileA_wrap(const char *fileName)
{
	char *tmpFileName = convertFilePath(fileName, false);
	BOOL ret = DeleteFileA(tmpFileName);
	free(tmpFileName);
	return ret;
}
REALIGN STDCALL void *GetModuleHandleA_wrap(const char *moduleName)
{
	return GetModuleHandleA(moduleName);
}
REALIGN STDCALL BOOL CloseHandle_wrap(void *handle)
{
	return CloseHandle(handle);
}
REALIGN STDCALL HANDLE CreateEventA_wrap(SECURITY_ATTRIBUTES *eventAttributes, BOOL bManualReset, BOOL bInitialState, const char *lpName)
{
	return CreateEventA(eventAttributes, bManualReset, bInitialState, lpName);
}
REALIGN STDCALL BOOL SetEvent_wrap(HANDLE event)
{
	return SetEvent(event);
}
REALIGN STDCALL uint32_t WaitForMultipleObjects_wrap(uint32_t nCount, void *const *lpHandles, BOOL bWaitAll, uint32_t dwMilliseconds)
{
	return WaitForMultipleObjects(nCount, lpHandles, bWaitAll, dwMilliseconds);
}
REALIGN STDCALL BOOL DuplicateHandle_wrap(void *hSourceProcessHandle, void *hSourceHandle, void *hTargetProcessHandle, void **lpTargetHandle, uint32_t desiredAccess, BOOL bInheritHandle, uint32_t dwOptions)
{
	return DuplicateHandle(hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle, desiredAccess, bInheritHandle, dwOptions);
}
REALIGN STDCALL void *GetCurrentProcess_wrap(void)
{
	return GetCurrentProcess();
}
REALIGN STDCALL void GetSystemInfo_wrap(SYSTEM_INFO *lpSystemInfo)
{
	return GetSystemInfo(lpSystemInfo);
}
REALIGN STDCALL uint32_t GetCurrentDirectoryA_wrap(uint32_t bufferLength, char *buffer)
{
	return GetCurrentDirectoryA(bufferLength, buffer);
}
REALIGN STDCALL BOOL SetCurrentDirectoryA_wrap(const char *pathName)
{
	char *tmpPathName = convertFilePath(pathName, false);
	BOOL ret = SetCurrentDirectoryA(tmpPathName);
	free(tmpPathName);
	return ret;
}
REALIGN STDCALL BOOL FindNextFileA_wrap(void *findFile, WIN32_FIND_DATAA *findFileData)
{
	return FindNextFileA(findFile, findFileData);
}
REALIGN STDCALL BOOL FindClose_wrap(void *findFile)
{
	return FindClose(findFile);
}
REALIGN STDCALL void *FindFirstFileA_wrap(const char *fileName, WIN32_FIND_DATAA *findFileData)
{
	return FindFirstFileA(fileName, findFileData);
}

#else /* Linux functions */

static uint32_t overlapped_error;

extern char *serialPort[4];
extern SDL_mutex *event_mutex;
extern SDL_cond *event_cond;

static int threadFunction(void *data)
{
	Thread *thread = (Thread *)data;
	SDL_SemWait(thread->sem);
	SDL_DestroySemaphore(thread->sem);
#ifdef NFS_CPP
	thread->function(thread->arg);
#else
	thread->threadParameter(); //In this game thread parameter is a function address
#endif
	return 0;
}

/**/

REALIGN STDCALL void *CreateThread_wrap(void *threadAttributes, uint32_t stackSize, THREAD_START_ROUTINE startAddress, void *parameter, uint32_t creationFlags, uint32_t *threadId)
{
	Thread *thread = (Thread *)malloc(sizeof(Thread));
	thread->handleType = HandleThread;
#ifdef NFS_CPP
	thread->function = startAddress;
	thread->arg = parameter;
#else
	thread->threadParameter = parameter;
#endif
	thread->sem = SDL_CreateSemaphore(!(creationFlags & 0x4 /* Start paused thread */));
	SDL_Thread *sdl_thread = SDL_CreateThread(threadFunction, NULL, thread);
	if (threadId)
		*threadId = SDL_GetThreadID(sdl_thread);
	SDL_DetachThread(sdl_thread);
	return thread;
}
REALIGN STDCALL uint32_t ResumeThread_wrap(Thread *thread)
{
	SDL_SemPost(thread->sem);
	return 0;
}
REALIGN STDCALL BOOL SetThreadPriority_wrap(Thread *thread, int priority)
{
	return false;
}
REALIGN STDCALL uint32_t GetCurrentThreadId_wrap(void)
{
	return SDL_ThreadID();
}
REALIGN STDCALL void *GetCurrentThread_wrap(void)
{
	return NULL;
}
REALIGN STDCALL BOOL TerminateThread_wrap(Thread *thread, uint32_t exitCode)
{
	return false;
}
REALIGN STDCALL void InitializeCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	criticalSection->mutex = SDL_CreateMutex();
}
REALIGN STDCALL void EnterCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	SDL_LockMutex(criticalSection->mutex);
}
REALIGN STDCALL void LeaveCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	SDL_UnlockMutex(criticalSection->mutex);
}
REALIGN STDCALL void DeleteCriticalSection_wrap(CRITICAL_SECTION *criticalSection)
{
	SDL_DestroyMutex(criticalSection->mutex);
	criticalSection->mutex = NULL;
}

REALIGN STDCALL void GlobalMemoryStatus_wrap(MEMORYSTATUS *memoryStatus)
{
	memset(memoryStatus, 0, sizeof(MEMORYSTATUS));
	memoryStatus->length = sizeof(MEMORYSTATUS);
	memoryStatus->memoryLoad = 0;
	memoryStatus->totalPhys = 0x7FFFFFFF;
	memoryStatus->totalPageFile = 0x7FFFFFFF;
	memoryStatus->availPageFile = 0x7FFFFFFF;
	memoryStatus->totalVirtual = 0x7FFFFFFF;
	memoryStatus->availVirtual = 0x7FFFFFFF;
}

REALIGN STDCALL void ExitProcess_wrap(uint32_t exitCode)
{
	exit(exitCode);
}

REALIGN STDCALL uint32_t GetLastError_wrap(void)
{
	if (overlapped_error)
	{
		uint32_t e = overlapped_error;
		overlapped_error = 0;
		return e;
	}
	switch (errno)
	{
		case ENOENT:
			return errno;
	}
	return 0;
}

REALIGN STDCALL Event *CreateEventA_wrap(SECURITY_ATTRIBUTES *eventAttributes, BOOL manualReset, BOOL initialState, const char *name)
{
	Event *event = (Event *)malloc(sizeof(Event));
	event->handleType = HandleEvent;
	event->manualReset = manualReset;
	event->is_set = initialState;
	return event;
}
REALIGN STDCALL BOOL SetEvent_wrap(Event *event)
{
	if (event)
	{
		SDL_LockMutex(event_mutex);
		event->is_set = true;
		SDL_CondBroadcast(event_cond);
		SDL_UnlockMutex(event_mutex);
		return true;
	}
	return false;
}
REALIGN STDCALL uint32_t WaitForMultipleObjects_wrap(uint32_t count, Event *const *events, BOOL waitAll, uint32_t milliseconds)
{
	//milliseconds always -1 or 0
	//waitAll always false
	uint32_t i, ret = WAIT_TIMEOUT;
	SDL_LockMutex(event_mutex);
	for (;;)
	{
		for (i = 0; i != count; ++i)
		{
			if (events[i]->is_set)
			{
				if (ret == WAIT_TIMEOUT)
					ret = i;
				if (!events[i]->manualReset)
					events[i]->is_set = false;
			}
		}
		if (ret != WAIT_TIMEOUT || !milliseconds)
			break;
		if (SDL_CondWait(event_cond, event_mutex) == -1) //no timeout, because milliseconds will be always -1 here
		{
			ret = -1;
			break;
		}
	}
	SDL_UnlockMutex(event_mutex);
	return ret;
}

static int serialPortThread(void *data)
{
	File *file = (File *)data;
	struct timeval tv;
	int bread, r;
	fd_set fds;
	for (;;)
	{
		FD_ZERO(&fds);
		FD_SET(file->fd, &fds);
		tv.tv_sec = 0;
		tv.tv_usec = file->us_timeout;
		r = select(file->fd + 1, &fds, NULL, NULL, &tv);
		SDL_LockMutex(file->mutex);
		if (r < 0)
		{
			file->pending = false;
			SDL_UnlockMutex(file->mutex);
			break;
		}
		else if (r == 1)
		{
			if ((bread = read(file->fd, file->asyncReadBuffer, file->toRead)) > 0)
			{
				if ((file->toRead -= bread))
					file->asyncReadBuffer += bread;
				else
					file->pending = false;
				file->readSoFar += bread;
			}
			else if (bread < 0 || !file->toRead) //is it necessary?
			{
				file->pending = false;
				SDL_UnlockMutex(file->mutex);
				break;
			}
		}
		SetEvent_wrap(file->readOverlapped->hEvent);
		if (!file->pending)
		{
			SDL_UnlockMutex(file->mutex);
			break;
		}
		SDL_UnlockMutex(file->mutex);
	}
	return 0;
}

REALIGN STDCALL File *CreateFileA_wrap(const char *fileName, uint32_t desiredAccess, uint32_t shareMode, SECURITY_ATTRIBUTES *securityAttributes, uint32_t creationDisposition, uint32_t flagsAndAttributes, void *templateFile)
{
	uint32_t COM_number = 0;
	if (!strncasecmp(fileName, "\\\\.\\com", 7))
		COM_number = fileName[7] - '0';
	char *tmpFileName = COM_number ? strdup(serialPort[COM_number - 1]) : convertFilePath(fileName, true);

	File *file = NULL;
	int fd = -1;
	switch (desiredAccess)
	{
		case GENERIC_READ | GENERIC_WRITE:
			if (COM_number)
				fd = open(tmpFileName, O_RDWR | O_NOCTTY | O_NDELAY);
			break;
		case GENERIC_WRITE:
			fd = open(tmpFileName, O_CREAT | O_WRONLY | O_TRUNC, 0644);
			break;
		case GENERIC_READ:
			fd = open(tmpFileName, O_RDONLY);
			break;
	}
	if (fd > 0)
	{
		file = calloc(1, sizeof(File));
		file->handleType = HandleFile;
		if ((file->async = !!(flagsAndAttributes & 0x40000000 /* Overlapped, async mode */)))
			file->mutex = SDL_CreateMutex();
		file->fd = fd;
	}

	free(tmpFileName);

	return file ? file : (File *)-1;
}
REALIGN STDCALL uint32_t GetFileSize_wrap(File *file, uint32_t *fileSizeHigh)
{
	struct stat stat;
	if (!fstat(file->fd, &stat))
		return stat.st_size;
	return -1;
}
REALIGN STDCALL FileMapping *CreateFileMappingA_wrap(File *file, SECURITY_ATTRIBUTES *fileMappingAttributes, uint32_t protect, uint32_t maximumSizeHigh, uint32_t maximumSizeLow, const char *name)
{
	FileMapping *fileMapping = (FileMapping *)malloc(sizeof(FileMapping));
	fileMapping->handleType = HandleFileMapping;
	fileMapping->fd = file->fd;
	return fileMapping;
}
REALIGN STDCALL void *MapViewOfFile_wrap(FileMapping *fMapping, uint32_t desiredAccess, uint32_t fileOffsetHigh, uint32_t fileOffsetLow, uint32_t numberOfBytesToMap)
{
	//Cannot use mmap() because UnmapViewOfFile doesn't provide the size. I don't want to use an array for sizes. This is also OK.
	uint32_t size = GetFileSize_wrap((File *)fMapping, NULL);
	void *fileMap = NULL;
	if (size > 0)
	{
		off_t pos = lseek(fMapping->fd, 0, SEEK_CUR);
		lseek(fMapping->fd, 0, SEEK_SET);
		fileMap = malloc(size + 4);
		read(fMapping->fd, fileMap, size);
		lseek(fMapping->fd, pos, SEEK_SET);
	}
	return fileMap;
}
REALIGN STDCALL BOOL UnmapViewOfFile_wrap(const void *lpBaseAddress)
{
	free((void *)lpBaseAddress);
	return true;
}
REALIGN STDCALL BOOL FlusfileBuffers_wrap(File *file)
{
	return !fsync(file->fd);
}
REALIGN STDCALL BOOL GetOverlappedResult_wrap(File *file, OVERLAPPED *overlapped, uint32_t *lpNumberOfBytesTransferred, BOOL bWait)
{
	SDL_LockMutex(file->mutex);
	if (file->readOverlapped == overlapped)
	{
		if ((*lpNumberOfBytesTransferred = file->readSoFar) > 0)
		{
			SDL_UnlockMutex(file->mutex);
			return true;
		}
	}
	SDL_UnlockMutex(file->mutex);
	return false;
}
REALIGN STDCALL BOOL SetEndOfFile_wrap(File *file)
{
	return !lseek(file->fd, 0, SEEK_END);
}
REALIGN STDCALL uint32_t SetFilePointer_wrap(File *file, uint32_t distanceToMove, uint32_t *distanceToMoveHigh, uint32_t moveMethod)
{
	return lseek(file->fd, distanceToMove, moveMethod);
}
REALIGN STDCALL BOOL WriteFile_wrap(File *file, const void *buffer, uint32_t numberOfBytesToWrite, uint32_t *numberOfBytesWritten, OVERLAPPED *overlapped)
{
	BOOL hasEvent = file->async && overlapped && overlapped->hEvent, ret;
	if (hasEvent)
	{
		SDL_LockMutex(event_mutex);
		((Event *)overlapped->hEvent)->is_set = false;
		SDL_UnlockMutex(event_mutex);
	}
	*numberOfBytesWritten = write(file->fd, buffer, numberOfBytesToWrite);
	ret = numberOfBytesToWrite == *numberOfBytesWritten;
	if (hasEvent && ret)
	{
		tcdrain(file->fd);
		SetEvent_wrap(overlapped->hEvent);
	}
	return ret;
}
REALIGN STDCALL BOOL ReadFile_wrap(File *file, void *buffer, uint32_t numberOfBytesToRead, uint32_t *numberOfBytesRead, OVERLAPPED *overlapped)
{
	if (file->async)
	{
		if (overlapped && overlapped->hEvent)
		{
			SDL_LockMutex(file->mutex);

			SDL_LockMutex(event_mutex);
			((Event *)overlapped->hEvent)->is_set = false;
			SDL_UnlockMutex(event_mutex);

			file->asyncReadBuffer = buffer;
			file->readOverlapped = overlapped;
			file->toRead = numberOfBytesToRead;
			file->readSoFar = 0;

			if (!file->pending)
			{
				file->pending = true;
				SDL_DetachThread(SDL_CreateThread(serialPortThread, NULL, file));
			}
			overlapped_error = ERROR_IO_PENDING;

			SDL_UnlockMutex(file->mutex);
		}
		*numberOfBytesRead = 0;
		return false;
	}
	*numberOfBytesRead = read(file->fd, buffer, numberOfBytesToRead);
	return *numberOfBytesRead == numberOfBytesToRead;
}
REALIGN STDCALL BOOL GetCommState_wrap(File *file, DCB *dcb)
{
	return true;
}
REALIGN STDCALL BOOL PurgeComm_wrap(File *file, uint32_t flags)
{
	if (flags & 0x5)
		tcflush(file->fd, TCOFLUSH);
	if (flags & 0xA)
		tcflush(file->fd, TCIFLUSH);
	return true;
}
REALIGN STDCALL BOOL SetCommState_wrap(File *file, DCB *dcb)
{
	struct termios tty;
	memset(&tty, 0, sizeof(struct termios));
	cfsetospeed(&tty, B9600);
	cfsetispeed(&tty, B9600);
	tty.c_iflag |= IGNBRK;
	tty.c_cflag |= CS8 | CLOCAL | CREAD;
	return !tcsetattr(file->fd, TCSANOW, &tty);
}
REALIGN STDCALL BOOL SetCommTimeouts_wrap(File *file, COMMTIMEOUTS *commTimeouts)
{
	file->us_timeout = commTimeouts->ReadTotalTimeoutConstant * 1000;
	return true;
}

REALIGN STDCALL BOOL DeleteFileA_wrap(const char *fileName)
{
	char *tmpFileName = convertFilePath(fileName, true);
	BOOL ret = !unlink(tmpFileName);
	free(tmpFileName);
	return ret;
}

REALIGN STDCALL void *GetModuleHandleA_wrap(const char *moduleName)
{
	return NULL;
}
REALIGN STDCALL BOOL CloseHandle_wrap(void *handle)
{
	if (!handle)
		return false;
	switch (*(HandleType *)handle)
	{
		case HandleThread:
		{
			Thread *thread = (Thread *)handle;
			free(thread);
			return true;
		}
		case HandleFile:
		{
			File *file = (File *)handle;
			SDL_LockMutex(file->mutex);
			close(file->fd);
			SDL_UnlockMutex(file->mutex);
			while (file->pending) //Cannot wait for finished, because thread is detached
				SDL_Delay(10);
			SDL_DestroyMutex(file->mutex);
			free(file);
			return true;
		}
		case HandleFileMapping:
		{
			FileMapping *fMapping = (FileMapping *)handle;
			free(fMapping);
			return true;
		}
		case HandleEvent:
		{
			Event *event = (Event *)handle;
			free(event);
			return true;
		}
	}
	return false;
}

REALIGN STDCALL BOOL DuplicateHandle_wrap(void *hSourceProcessHandle, void *hSourceHandle, void *hTargetProcessHandle, void **lpTargetHandle, uint32_t desiredAccess, BOOL bInheritHandle, uint32_t dwOptions)
{
	*lpTargetHandle = NULL;
	return false;
}

REALIGN STDCALL void *GetCurrentProcess_wrap(void)
{
	return NULL;
}

REALIGN STDCALL void GetSystemInfo_wrap(SYSTEM_INFO *systemInfo)
{
	memset(systemInfo, 0, sizeof(SYSTEM_INFO));
	systemInfo->pageSize = getpagesize();
}

REALIGN STDCALL uint32_t GetCurrentDirectoryA_wrap(uint32_t bufferLength, char *buffer)
{
	if (getcwd(buffer, bufferLength))
		return bufferLength;
	return 0;
}
REALIGN STDCALL BOOL SetCurrentDirectoryA_wrap(const char *pathName)
{
	char *tmpPathName = convertFilePath(pathName, false);
	BOOL ret = !chdir(tmpPathName);
	free(tmpPathName);
	return ret;
}

REALIGN STDCALL BOOL FindNextFileA_wrap(FindFile *findFile, WIN32_FIND_DATA *findFileData)
{
	struct dirent *de;
	int pos;
	while ((de = readdir(findFile->dir)))
	{
		if (*de->d_name == '.' || de->d_type == DT_DIR)
			continue;
		pos = strlen(de->d_name) - strlen(findFile->filter + 1);
		if (pos < 0 || strcasecmp(de->d_name + pos, findFile->filter + 1))
			continue;
		strcpy(findFileData->fileName, de->d_name);
		return true;
	}
	return false;
}
REALIGN STDCALL BOOL FindClose_wrap(FindFile *findFile)
{
	if (findFile)
	{
		if (findFile->dir)
			closedir(findFile->dir);
		free(findFile->filter);
		free(findFile);
		return true;
	}
	return false;
}
REALIGN STDCALL FindFile *FindFirstFileA_wrap(const char *fileName, WIN32_FIND_DATA *findFileData)
{
	memset(findFileData, 0, sizeof(WIN32_FIND_DATA));

	if (*fileName != '*') //This condition should be always false
		return (FindFile *)-1;

	DIR *dir = opendir(".");
	if (!dir)
		return (FindFile *)-1;

	FindFile *findFile = (FindFile *)malloc(sizeof(FindFile));
	findFile->dir = dir;
	findFile->filter = strdup(fileName);

	if (!FindNextFileA_wrap(findFile, findFileData))
	{
		FindClose_wrap(findFile);
		return (FindFile *)-1;
	}

	return findFile;
}

#endif
