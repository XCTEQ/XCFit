#ifndef D_SlimConnectionHandler_H
#define D_SlimConnectionHandler_H

typedef struct SlimConnectionHandler SlimConnectionHandler;

typedef int(*com_func_t)(void * handle, char * msg, int length);
typedef char * (*handler_func_t)(void *, char *);

SlimConnectionHandler* SlimConnectionHandler_Create(com_func_t sendFunction, com_func_t recvFunction, void * comLink);
void SlimConnectionHandler_Destroy(SlimConnectionHandler*);
int SlimConnectionHandler_Run(SlimConnectionHandler*);
void SlimConnectionHandler_RegisterSlimMessageHandler(SlimConnectionHandler*, void* handler, handler_func_t );

#endif
