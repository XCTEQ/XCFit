#import <Foundation/Foundation.h>

@interface OCSInvocation : NSObject

+(id) invocationWithInstance: (id) givenInstance
                  methodName: (NSString*) givenMethodName
                andArguments: (NSArray*) givenArgs;

-(NSString*) invoke;

@end