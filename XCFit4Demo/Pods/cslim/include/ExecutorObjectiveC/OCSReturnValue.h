#import <Foundation/Foundation.h>

@interface OCSReturnValue : NSObject

+(NSString*) forInvocation:(NSInvocation*) invocation;
+(NSString*) forObject:(id)object;
@end
