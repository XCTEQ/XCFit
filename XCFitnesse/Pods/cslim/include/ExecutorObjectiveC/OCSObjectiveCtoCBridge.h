#import <Foundation/Foundation.h>
#import "SlimList.h"

char* NSStringToCString(NSString* string);
NSString* CStringToNSString(char const* cString);
NSString* SlimList_GetNSStringAt(SlimList* self, int index);
NSArray* SlimList_ToNSArray(SlimList* self);
SlimList* NSArray_ToSlimList(NSArray* self);
SlimList* NSDictionary_ToSlimList(NSDictionary* self);
void SlimList_AddNSString(SlimList* self, NSString* string);