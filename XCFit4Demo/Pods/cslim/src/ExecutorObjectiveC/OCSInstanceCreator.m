#import "OCSInstanceCreator.h"
#import "OCSException.h"

@interface OCSInstanceCreator ()

@property(nonatomic, strong) NSString* instanceName;
@property(nonatomic, strong) NSString* className;
@property(nonatomic, strong) NSArray* args;
@property(nonatomic, strong) id instance;
@property(nonatomic, strong) NSString* result;

@end

@implementation OCSInstanceCreator

+(id) instanceWithClassName:(NSString*) givenClassName
                    andArgs:(NSArray*) givenArgs {
    OCSInstanceCreator* instance = [self new];
    instance.className = givenClassName;
    instance.args = givenArgs;
    return instance;
}

-(id) create {
    if([self classToCreate]) {
        [self attemptCreateWithTryCatch];
    } else {
        [self handleInvalidClassException];
    }
    return self.instance;
}

-(void) attemptCreateWithTryCatch {
    @try {
        [self attemptCreate];
    }
    @catch (NSException* exception) {
        [self handleCouldNotInvokeContructorException];
    }
}

-(void) attemptCreate {
    switch ([self.args count]) {
        case 0:
            self.instance = [[[self classToCreate] alloc] init];
            break;
        case 1:
            self.instance = [[[self classToCreate] alloc] initWithString: [self.args objectAtIndex: 0]];
            break;
        default:
            self.instance = [[[self classToCreate] alloc] initWithArray: self.args];
            break;
    }
    self.result = @"OK";
}

-(void) handleInvalidClassException {
    self.result = [[OCSException exceptionWithMessage: @"NO_CLASS %@.", self.className] stringValue];
}

-(void) handleCouldNotInvokeContructorException {
    self.result = [[OCSException exceptionWithMessage: @"COULD_NOT_INVOKE_CONSTRUCTOR %@[%i].", self.className, (int)[self.args count]] stringValue];
}

-(Class) classToCreate {
    return NSClassFromString(self.className);
}

@end
