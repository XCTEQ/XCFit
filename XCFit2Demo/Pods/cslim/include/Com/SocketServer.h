#ifndef D_SocketServer_H
#define D_SocketServer_H

///////////////////////////////////////////////////////////////////////////////
//
//  SocketServer is responsible for ...
//
///////////////////////////////////////////////////////////////////////////////

typedef struct SocketServer SocketServer;

SocketServer* SocketServer_Create(void);
void SocketServer_Destroy(SocketServer*);
extern int SocketServer_Run(SocketServer* self, char * port);
extern void SocketServer_register_handler(SocketServer* self, int (*handlerFunction)(int));

#endif  // D_SocketServer_H
