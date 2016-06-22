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

#ifndef WSOCK32_H
#define WSOCK32_H

#include "Wrapper.h"

#ifndef WIN32
	#include <netinet/tcp.h>
	#include <netinet/in.h>
	#include <sys/socket.h>
	#include <arpa/inet.h>
	#include <sys/ioctl.h>
	#include <unistd.h>
	#include <string.h>
	#include <netdb.h>
	#include <errno.h>

	struct win_fd_set
	{
		uint32_t fd_count;
		int fd_array[64];
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

struct sockaddr_ipx
{
	int16_t sa_family;
	int8_t sa_netnum[4];
	int8_t sa_nodenum[6];
	uint16_t sa_socket;
};

#endif // WSOCK32_H
