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
