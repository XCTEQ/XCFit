#include <stdlib.h>
#include <string.h>

#include "Slim.h"
#include "SlimList.h"
#include "SlimListDeserializer.h"
#include "StatementExecutor.h"
#include "ListExecutor.h"
#include "SlimListSerializer.h"

void AddFixtures(StatementExecutor*);

struct Slim
{
  StatementExecutor * statementExecutor;
  ListExecutor * listExecutor;
};

Slim * Slim_Create()
{
  Slim * self = (Slim*)malloc(sizeof(Slim));
  memset(self, 0, sizeof(Slim));
  self->statementExecutor = StatementExecutor_Create();
  AddFixtures(self->statementExecutor);
  self->listExecutor = ListExecutor_Create(self->statementExecutor);
  return self;
}

void Slim_Destroy(Slim * self)
{
  ListExecutor_Destroy(self->listExecutor);
  StatementExecutor_Destroy(self->statementExecutor);
  free(self);
}

char * Slim_HandleMessage(void* voidSelf, char * message)
{
  Slim* self = (Slim*)voidSelf;
  SlimList* instructions = SlimList_Deserialize(message);
  SlimList* results = ListExecutor_Execute(self->listExecutor, instructions);
  char * response = SlimList_Serialize(results);
  SlimList_Destroy(results);
  SlimList_Destroy(instructions);
  return response;
}

int Slim_HandleConnection(Slim* self, void* comLink, com_func_t send, com_func_t recv)
{
  int result = 0;
  SlimConnectionHandler* connection = SlimConnectionHandler_Create(send, recv, comLink);
  SlimConnectionHandler_RegisterSlimMessageHandler(connection, self, &Slim_HandleMessage);
  result = SlimConnectionHandler_Run(connection);
  SlimConnectionHandler_Destroy(connection);
  return result;
}
