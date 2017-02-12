#import "OCSReturnValue.h"
#import "OCSObjectiveCtoCBridge.h"
#import "SlimListSerializer.h"

@implementation OCSReturnValue

+(NSString*) forInvocation:(NSInvocation*) invocation {
    if ([self signatureHasReturnTypeVoid: invocation.methodSignature]) {
        return @"OK";
    } else {
        id result;
        [invocation getReturnValue: &result];
        return [OCSReturnValue forObjectOrPrimitive: result
                          andMethodSignature: invocation.methodSignature];
    }
}

+(NSString*) forObjectOrPrimitive:(id) result andMethodSignature:(NSMethodSignature*) signature {
    NSString* returnType = [NSString stringWithUTF8String: [signature methodReturnType]];
    if ([returnType isEqualToString: @"@"]) {
        return [self forObject:result];
    } else {
        return [self forPrimitive:result withReturnType:returnType];
    }
}

+ (NSString *) forObject:(id)object {
    if([NSStringFromClass([object class]) isEqualToString: @"NSCFString"]) {
        return object;
    } else if([NSStringFromClass([object class]) isEqualToString: @"__NSCFString"]) {
        return object;
    } else if([NSStringFromClass([object class]) isEqualToString: @"__NSCFConstantString"]) {
        return object;
    } else if ([NSStringFromClass([object class]) isEqualToString:@"NSTaggedPointerString"]) {
        return object;
    } else if ([NSStringFromClass([object class]) containsString:@"_NSContiguousString"]) {
        return object;
    } else if ([NSStringFromClass([object class]) containsString:@"Array"]) {
        return [self forNSArray:object];
    } else if ([NSStringFromClass([object class]) isEqualToString:@"__NSCFBoolean"]) {
        return ((NSNumber *)object).boolValue ? @"true" : @"false";
    } else {
        return [object stringValue];
    }
}

+ (NSString *) forPrimitive:(id)primitive withReturnType:(NSString*)returnType {
    if ([returnType isEqualToString: @"i"]) {
        return [NSString stringWithFormat: @"%i", (int)primitive];
    } else if ([returnType isEqualToString: @"c"] || [returnType isEqualToString:@"B"]) {
        return ((BOOL)primitive) ? @"true" : @"false";
    } else {
        return @"OK";
    }
}

+(BOOL) signatureHasReturnTypeVoid:(NSMethodSignature*) methodSignature {
    return [[NSString stringWithUTF8String: [methodSignature methodReturnType]] isEqualToString: @"v"];
}

+ (NSString *) forNSArray:(NSArray *)array {
    SlimList *slimlist = NSArray_ToSlimList(array);
    NSString *result = CStringToNSString(SlimList_Serialize(slimlist));
    return result;
}

@end
