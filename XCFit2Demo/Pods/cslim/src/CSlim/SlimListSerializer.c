#include "SlimList.h"
#include "SlimListSerializer.h"
#include "SlimUtil.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

enum {LIST_OVERHEAD=9, ELEMENT_OVERHEAD=8};

char* nodeStringAt(SlimList* self, int i)
{
        char * nodeString = SlimList_GetStringAt(self, i);
        if (nodeString == NULL)
                nodeString = "null";
        return nodeString;
}

long FieldLength(unsigned char * nodeString)
{
        unsigned char *p;
        long fieldlength=0;
        for (p=nodeString;*p;p++)
          if (CSlim_IsCharacter(p) == 1)
           fieldlength++;
        return fieldlength;
}


int SlimList_SerializedLength(SlimList* self)
{
        int length = LIST_OVERHEAD;
        int i;
        for(i = 0; i < SlimList_GetLength(self); i++)
        {
                length += strlen(nodeStringAt(self, i)) + ELEMENT_OVERHEAD;
        }
        return length;
}

char* SlimList_Serialize(SlimList* self)
{
        char* buf = (char*)malloc(SlimList_SerializedLength(self)+1);
        char* write_ptr = buf;
        int listLength = SlimList_GetLength(self);
        int i;

        write_ptr += sprintf(write_ptr, "[%06d:", listLength);

        for(i = 0; i < listLength; i++)
        {
                unsigned char * nodeString = (unsigned char *) nodeStringAt(self, i);
                write_ptr += sprintf(write_ptr, "%06ld:%s:", FieldLength(nodeString), nodeString);
        }
        strcpy(write_ptr, "]");
        return buf;
}

void SlimList_Release(char *serializedResults)
{
  if(serializedResults)
    free(serializedResults);
}
