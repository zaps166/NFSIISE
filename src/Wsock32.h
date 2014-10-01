#ifndef WSOCK32_H
#define WSOCK32_H

#include "Wrapper.h"

#ifndef WIN32
	#include <sys/socket.h>
	#include <arpa/inet.h>
	#include <sys/ioctl.h>
	#include <unistd.h>
	#include <netdb.h>
	#include <errno.h>

	struct win_fd_set
	{
		uint32_t fd_count;
		int fd_array[ 64 ];
	};

	struct win_hostent
	{
		char *h_name;
		char **h_aliases;
		int16_t h_addrtype;
		int16_t h_length;
		char **h_addr_list;
	};
#else
	#include <winsock2.h>

	#define win_hostent hostent
	#define win_fd_set fd_set
	#define socklen_t int
#endif

#endif // WSOCK32_H
