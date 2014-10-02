#include "Wsock32.h"

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

	FD_ZERO( &fds );
	for ( i = 0 ; i < readfds->fd_count ; ++i )
	{
		FD_SET( readfds->fd_array[ i ], &fds );
		if ( readfds->fd_array[ i ] > max_fd )
			max_fd = readfds->fd_array[ i ];
	}

	if ( ( fd_count = select( max_fd + 1, &fds, NULL, NULL, timeout ) ) > 0 )
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
	return getsockname( sock, name, namelen );
}
STDCALL int bind_wrap( int sock, const struct sockaddr *name, int namelen )
{
#ifndef WIN32
	BOOL opt = true;
	setsockopt( sock, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof opt );
#endif
	return bind( sock, name, namelen );
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
	}
	return ioctl( sock, cmd, argp );
#else
	return ioctlsocket( sock, cmd, ( u_long * )argp );
#endif
}
STDCALL int setsockopt_wrap( int sock, int level, int optname, const char *optval, int optlen )
{
#ifndef WIN32
	switch ( optname )
	{
		case 0x8:
			optname = SO_KEEPALIVE;
			break;
	}
#endif
	return setsockopt( sock, level == 0xFFFF ? SOL_SOCKET : level, optname, optval, optlen );
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
#ifndef WIN32
	switch ( af )
	{
		case 0x6:
			af = AF_IPX;
			break;
	}
	/* protocol 1000 on IPX ? */
#endif
	return socket( af, type, protocol );
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
STDCALL int sendto_wrap( int sock, const char *buf, socklen_t len, int flags, const struct sockaddr *to, socklen_t tolen )
{
	return sendto( sock, buf, len, flags, to, tolen );
}
STDCALL int recvfrom_wrap( int sock, char *buf, socklen_t len, int flags, struct sockaddr *from, socklen_t *fromlen )
{
	return recvfrom( sock, buf, len, flags, from, fromlen );
}
