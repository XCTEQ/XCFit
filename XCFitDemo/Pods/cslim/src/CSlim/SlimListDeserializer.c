#include "SlimList.h"
#include "SlimUtil.h"
#include <stdlib.h>
#include <string.h>

#define SKIP(a) \
if (*current != (a))\
{\
        SlimList_Destroy(list); \
        return 0;\
}\
current++;

int readLength(char const** readPtr)
{
        int length = atoi(*readPtr);
        *readPtr += 6;
        return length;
}

int ByteLength( int characterLength, char const * current )
{
        unsigned char const * p;
        int chars=0;
        int bytes=0;
        for( p = (unsigned char const*) current; chars <= characterLength; p++)
        {
          bytes++;
          if( CSlim_IsCharacter(p) == 1 )
            chars++;
        }
        if( chars > characterLength )
          bytes--;
        return bytes;
}

SlimList* SlimList_Deserialize(char const* serializedList)
{
        int listLength;
        SlimList * list = 0;
        char const * current = 0;

        if(serializedList == 0 || strlen(serializedList) == 0)
                return 0;

        current = serializedList;
        list = SlimList_Create();

        SKIP('[')

        listLength = readLength(&current);

        SKIP(':')

        while (listLength--)
        {
                int characterLength = readLength(&current);
                SKIP(':')
                int byteLength = ByteLength(characterLength, current);
                SlimList_AddBuffer(list, current, byteLength);
                current += byteLength;
                SKIP(':')
        }

        SKIP(']')
        return list;
}

