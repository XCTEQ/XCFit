#include "TcpComLink.h"
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>

//static local variables
struct TcpComLink
{
    int socket;
};

TcpComLink* TcpComLink_Create(int socket)
{
	TcpComLink* self = (TcpComLink*)malloc(sizeof(TcpComLink));
	memset(self, 0, sizeof(TcpComLink));
	self->socket = socket;
	return self;
}

void TcpComLink_Destroy(TcpComLink* self)
{
    free(self);
}


int TcpComLink_send(void * voidSelf, char * msg, int length)
{
	TcpComLink * self = (TcpComLink *)voidSelf;
    int total = 0;        // how many bytes we've sent
    int bytesleft = length; // how many we have left to send
    int n;

    while(total < length) {
        n = (int)send(self->socket, msg+total, bytesleft, 0);
        if (n == -1) { break; }
        total += n;
        bytesleft -= n;
    }

    return total;
} 


int TcpComLink_recv(void * voidSelf, char * buffer, int length)
{
	TcpComLink * self = (TcpComLink *)voidSelf;
	return (int)recv(self->socket, buffer, length,  MSG_WAITALL);
}
