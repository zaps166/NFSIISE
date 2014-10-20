#include "Wsock32.h"

extern uint16_t PORT1, PORT2;

STDCALL uint32_t inet_addr_wrap( const char *cp )
{
	return inet_addr( cp );
}
STDCALL int listen_wrap( int fd, int n )
{
	return listen( fd, n );
}
STDCALL char *inet_ntoa_wrap( struct in_addr in )
{
	return inet_ntoa( in );
}
STDCALL struct win_hostent *gethostbyname_wrap( const char *name )
{
#ifdef WIN32
	return gethostbyname( name );
#else
	struct hostent *unix_hostent = gethostbyname( name );
	if ( unix_hostent )
	{
		static struct win_hostent w_hostent;
		w_hostent.h_name = unix_hostent->h_name;
		w_hostent.h_aliases = unix_hostent->h_aliases;
		w_hostent.h_addrtype = unix_hostent->h_addrtype;
		w_hostent.h_length = unix_hostent->h_length;
		w_hostent.h_addr_list = unix_hostent->h_addr_list;
		return &w_hostent;
	}
	return NULL;
#endif
}
STDCALL int gethostname_wrap( char *name, int namelen )
{
	return gethostname( name, namelen );
}
STDCALL int connect_wrap( int sock, const struct sockaddr *name, int namelen )
{
	( ( struct sockaddr_in * )name )->sin_port = htons( PORT1 );
	return connect( sock, name, namelen );
}
STDCALL int accept_wrap( int sock, struct sockaddr *addr, socklen_t *addrlen )
{
	return accept( sock, addr, addrlen );
}
STDCALL int WSAFDIsSet_wrap( int fd, struct win_fd_set *w_fds )
{
#ifdef WIN32
	return __WSAFDIsSet( fd, w_fds );
#else
	uint32_t i;
	for ( i = 0 ; i < w_fds->fd_count ; ++i )
		if ( w_fds->fd_array[ i ] == fd )
			return 1;
	return 0;
#endif
}
STDCALL int select_wrap( int nfds, struct win_fd_set *readfds, struct win_fd_set *writefds, struct win_fd_set *exceptfds, struct timeval *timeout )
{
#ifdef WIN32
	return select( nfds, readfds, writefds, exceptfds, timeout );
#else
	uint32_t i, j, fd_count, max_fd = 0;
	fd_set fds;

	struct timeval tv = { 0, 10000 }; /* On Linux, exiting from UDP game host hangs for long time */

	FD_ZERO( &fds );
	for ( i = 0 ; i < readfds->fd_count ; ++i )
	{
		FD_SET( readfds->fd_array[ i ], &fds );
		if ( readfds->fd_array[ i ] > max_fd )
			max_fd = readfds->fd_array[ i ];
	}

	if ( ( fd_count = select( max_fd + 1, &fds, NULL, NULL, &tv ) ) > 0 )
		for ( i = 0, j = 0 ; i < readfds->fd_count ; ++i )
			if ( FD_ISSET( readfds->fd_array[ i ], &fds ) && j != i )
				readfds->fd_array[ j++ ] = readfds->fd_array[ i ];

	return ( readfds->fd_count = fd_count );
#endif
}
STDCALL int send_wrap( int sock, const char *buf, socklen_t len, int flags )
{
	return send( sock, buf, len, flags );
}
STDCALL int recv_wrap( int sock, char *buf, socklen_t len, int flags )
{
	return recv( sock, buf, len, flags );
}
STDCALL int getsockname_wrap( int sock, struct sockaddr *name, socklen_t *namelen )
{
	if ( *namelen == sizeof( struct sockaddr_ipx ) )
	{
		memset( name, 0x00, sizeof( struct sockaddr_ipx ) ); /* It works */
		return 0;
	}
	return getsockname( sock, name, namelen );
}
STDCALL int bind_wrap( int sock, const struct sockaddr *name, int namelen )
{
	struct sockaddr_in name_in;
	name_in.sin_family = AF_INET;
	name_in.sin_addr.s_addr = INADDR_ANY;
	if ( namelen == sizeof( struct sockaddr_ipx ) )
		name_in.sin_port = ( ( struct sockaddr_ipx * )name )->sa_socket ? htons( PORT2 ) : htons( PORT1 );
	else
		name_in.sin_port = ( ( struct sockaddr_in * )name )->sin_port ? htons( PORT1 ) : 0;
	return bind( sock, ( struct sockaddr * )&name_in, sizeof name_in );
}
STDCALL uint16_t htons_wrap( uint16_t hostshort )
{
	return htons( hostshort );
}
STDCALL int ioctlsocket_wrap( int sock, int32_t cmd, uint32_t *argp )
{
#ifndef WIN32
	switch ( cmd )
	{
		case 0x8004667E:
			cmd = FIONBIO;
			break;
		case 0x4004667F:
			cmd = FIONREAD;
			break;
	}
	return ioctl( sock, cmd, argp );
#else
	return ioctlsocket( sock, cmd, ( u_long * )argp );
#endif
}
STDCALL int setsockopt_wrap( int sock, int level, int optname, const char *optval, socklen_t optlen )
{
	switch ( optname )
	{
		case SO_DEBUG:
			return -1;
#ifndef WIN32
		case 0x8:
			optname = SO_KEEPALIVE;
			break;
		case 0x20:
			optname = SO_BROADCAST;
			break;
#endif
		case 0x400F: /* IPX_RECEIVE_BROADCAST */
			return -1; /* It is not necessary so I don't emulate it */
	}
	switch ( level )
	{
#ifndef WIN32
		case 0xFFFF:
			level = SOL_SOCKET;
			break;
#endif
	}
	return setsockopt( sock, level, optname, optval, optlen );
}
STDCALL int WSAGetLastError_wrap( void )
{
#ifdef WIN32
	return WSAGetLastError();
#else
	switch ( errno )
	{
		case ENOBUFS:
			return 10055; //used
		case ECONNREFUSED:
			return 10061;
		case EWOULDBLOCK:
		case EINPROGRESS:
			return 10035; //used
		case ECONNRESET:
			return 10054;
		case ENOPROTOOPT:
			return 10042;
	}
	return 0;
#endif
}
STDCALL int closesocket_wrap( int sock )
{
#ifdef WIN32
	return closesocket( sock );
#else
	return close( sock );
#endif
}
STDCALL int socket_wrap( int af, int type, int protocol )
{
	BOOL isTCP = true;
	if ( af == 0x6 /* AF_IPX */ )
	{
		isTCP = false;

		af = AF_INET;
		type = SOCK_DGRAM;
		protocol = IPPROTO_UDP;
	}
	int s = socket( af, type, protocol );
	if ( isTCP && s > 0 )
	{
		BOOL opt = true;
		setsockopt( s, IPPROTO_TCP, TCP_NODELAY, ( char * )&opt, sizeof opt );
	}
	return s;
}
STDCALL int WSACleanup_wrap( void )
{
#ifdef WIN32
	return WSACleanup();
#else
	return 0;
#endif
}
STDCALL int WSAStartup_wrap( uint16_t wVersionRequested, void *WSAData )
{
#ifdef WIN32
	return WSAStartup( wVersionRequested, WSAData );
#else
	return 0;
#endif
}
STDCALL int sendto_wrap( int sock, const char *buf, socklen_t len, int flags, const struct sockaddr_ipx *to, socklen_t tolen )
{
	struct sockaddr_in to_in;
	char *data = ( char * )malloc( len += 2 );

	to_in.sin_family = AF_INET;
	to_in.sin_port = htons( PORT1 );
	if ( !memcmp( to->sa_nodenum, "\0\0\0\0\0\0", 6 ) ) /* 0x000000000000 address is broadcast too */
		memset( &to_in.sin_addr.s_addr, 0xFF, 4 );
	else
		memcpy( &to_in.sin_addr.s_addr, to->sa_nodenum, 4 ); /* IPX address to INET address */

	memcpy( data, &to->sa_socket, 2 ); /* IPX socket type */
	memcpy( data + 2, buf, len - 2 ); /* Data */

	int bsent = sendto( sock, data, len, flags, ( struct sockaddr * )&to_in, sizeof to_in );
	if ( bsent == len && to->sa_socket ) /* If IPX socket type is not 0 (0x452) then send it to second port too */
	{
		to_in.sin_port = htons( PORT2 );
		bsent = sendto( sock, data, len, flags, ( struct sockaddr * )&to_in, sizeof to_in );
	}

	if ( bsent >= 2 )
		bsent -= 2;

	free( data );
	return bsent;
}
STDCALL int recvfrom_wrap( int sock, char *buf, socklen_t len, int flags, struct sockaddr_ipx *from, socklen_t *fromlen )
{
	struct sockaddr_in from_in;
	socklen_t fromlen_in = sizeof from_in;
	char *data = ( char * )malloc( len += 2 );

	int brecv = recvfrom( sock, data, len, flags, ( struct sockaddr * )&from_in, &fromlen_in );
	if ( brecv <= 2 )
	{
		free( data );
		return -1;
	}

	from->sa_family = 0x6; /* AF_IPX */
	memset( from->sa_netnum, 0x00, sizeof from->sa_netnum );
	memcpy( from->sa_nodenum, &from_in.sin_addr, 4 ); /* INET address to IPX address */
	memset( from->sa_nodenum + 4, 0, 2 ); /* IP address is only 32-bit, zeroing leading 16-bits */
	memcpy( &from->sa_socket, data, 2 ); /* IPX socket type */

	memcpy( buf, data + 2, brecv -= 2 );

	free( data );
	return brecv;
}
