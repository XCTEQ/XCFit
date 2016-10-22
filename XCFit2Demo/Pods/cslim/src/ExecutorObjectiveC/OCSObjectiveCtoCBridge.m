#import "OCSObjectiveCtoCBridge.h"
#import "OCSReturnValue.h"
#import "SlimList.h"
#import "SlimListSerializer.h"
#import <objc/runtime.h>

char* NSStringToCString(NSString* string) {
    return (char*)[string UTF8String];
}

NSString* CStringToNSString(char const* cString) {
    return [NSString stringWithUTF8String: cString];
}

NSArray* SlimList_ToNSArray(SlimList* self) {
    int length = SlimList_GetLength(self);
    NSMutableArray* array = [NSMutableArray array];
    for(int i=0; i<length; i++) {
        [array addObject: SlimList_GetNSStringAt(self, i)];
    }
    return array;
}

NSString* SlimList_GetNSStringAt(SlimList* self, int index) {
    return CStringToNSString(SlimList_GetStringAt(self, index));
}

void SlimList_AddNSString(SlimList* self, NSString* string) {
    SlimList_AddString(self, NSStringToCString(string));
}

SlimList* NSDictionary_ToSlimList(NSDictionary* self) {
    
    SlimList* list = SlimList_Create();
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        SlimList *pair = SlimList_Create();
        NSString *kee = [OCSReturnValue forObject:key];
        NSString *value = [OCSReturnValue forObject:obj];
        SlimList_AddString(pair, NSStringToCString(kee));
        SlimList_AddString(pair, NSStringToCString(value));
        SlimList_AddList(list, pair);
        SlimList_Destroy(pair);
    }];
    
    return list;
}

SlimList* NSArray_ToSlimList(NSArray* self) {
    SlimList *list = SlimList_Create();
    for (id object in self) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            SlimList *result = NSDictionary_ToSlimList(object);
            SlimList_AddList(list, result);
            SlimList_Destroy(result);
        } else {
            NSString *item = [OCSReturnValue forObject:object];
            SlimList_AddString(list, NSStringToCString(item));
        }
    }
    return list;
}
