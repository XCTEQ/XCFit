#ifndef D_SlimList_H
#define D_SlimList_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct SlimList SlimList;

SlimList* SlimList_Create(void);
void SlimList_Destroy(SlimList*);
extern void SlimList_AddString(SlimList*, char const *);
void SlimList_AddList(SlimList* self, SlimList* element);
int SlimList_GetLength(SlimList*);
int SlimList_Equals(SlimList* self, SlimList* other);
SlimList * SlimList_GetListAt(SlimList* self, int index);
char * SlimList_GetStringAt(SlimList* self, int index);
double SlimList_GetDoubleAt(SlimList* self, int index);
SlimList* SlimList_GetHashAt(SlimList* self, int index);
void SlimList_ReplaceAt(SlimList* self, int index, char const * replacementString);
void SlimList_AddBuffer(SlimList* self, char const* buffer, int length);
SlimList* SlimList_GetTailAt(SlimList*, int index);
char* SlimList_ToString(SlimList*);
#ifdef __cplusplus
}
#endif


#endif
