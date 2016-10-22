#import <Foundation/Foundation.h>

@interface OCSSelector : NSObject

+(SEL) selectorForString:(NSString*) methodName andArgs:(NSArray*) args;

+(NSArray*) methodParts:(NSString *) methodName;

@end
