#ifndef D_TcpComLink_H
#define D_TcpComLink_H

///////////////////////////////////////////////////////////////////////////////
//
//  TcpComLink is responsible for ...
//
///////////////////////////////////////////////////////////////////////////////

typedef struct TcpComLink TcpComLink;

TcpComLink* TcpComLink_Create(int socket);
void TcpComLink_Destroy(TcpComLink*);
int TcpComLink_send(void * voidSelf, char * msg, int length);
int TcpComLink_recv(void * voidSelf, char * buffer, int length);

#endif  // D_TcpComLink_H
