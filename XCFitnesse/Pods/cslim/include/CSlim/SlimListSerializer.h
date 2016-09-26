#ifndef SlimListSerializer_H
#define SlimListSerializer_H
#include "SlimList.h"

char* SlimList_Serialize(SlimList*);
void SlimList_Release(char *serializedResults);
int SlimList_SerializedLength(SlimList*);

#endif
