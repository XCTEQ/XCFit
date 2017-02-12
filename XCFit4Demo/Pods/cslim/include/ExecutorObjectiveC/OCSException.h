#import <Foundation/Foundation.h>

@interface OCSException : NSObject

+(id) exceptionWithNSException:(NSException*) givenException;
+(id) exceptionWithMessage:(NSString*) message, ... NS_FORMAT_FUNCTION(1,2);

-(NSString*) stringValue;

@end
