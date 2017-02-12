#import "OCSException.h"

@interface OCSException ()

@property (nonatomic, strong) NSString* message;

@end

@implementation OCSException

+(id) exceptionWithNSException:(NSException*) givenException {
    NSString* formattedMessage = [NSString stringWithFormat: @"%@ %@",
                                  [givenException name],
                                  [givenException reason]];
    return [[self alloc] initWithFormattedMessage: formattedMessage];
}

+(id) exceptionWithMessage:(NSString*) message, ... NS_FORMAT_FUNCTION(1,2) {
    va_list args;
    va_start(args, message);
    NSString *formattedMessage = [[NSString alloc] initWithFormat: message arguments:args];
    va_end(args);
    return [[self alloc] initWithFormattedMessage: formattedMessage];
}

-(id) initWithFormattedMessage:(NSString*) formattedMessage {
    if ((self = [super init])) {
        self.message = formattedMessage;
    }
    return self;
}

-(NSString*) stringValue {
    return [NSString stringWithFormat: @"__EXCEPTION__:message:<<%@>>", self.message];
}

@end
