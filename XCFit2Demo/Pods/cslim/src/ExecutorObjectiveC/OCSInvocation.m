#import "OCSInvocation.h"
#import "OCSReturnValue.h"
#import "OCSSelector.h"

@interface OCSInvocation ()

@property (nonatomic, strong) NSInvocation* invocation;
@property (nonatomic, strong) NSArray* args;
@property (nonatomic, strong) NSString* methodName;
@property (nonatomic, strong) id instance;

@end

@implementation OCSInvocation

+(id) invocationWithInstance: (id) givenInstance
                  methodName: (NSString*) givenMethodName
                andArguments: (NSArray*) givenArgs {
    return [[OCSInvocation alloc] initWithInstance: givenInstance
                                        methodName: givenMethodName
                                      andArguments: givenArgs];
}

-(id) initWithInstance: (id) givenInstance
            methodName: (NSString*) givenMethodName
          andArguments: (NSArray*) givenArgs  {
    if ((self = [super init])) {
        self.args = givenArgs;
        self.methodName = givenMethodName;
        self.instance = givenInstance;
        [self buildInvocation];
    }
    return self;
}

-(NSString*) invoke {
    [self.invocation invoke];
    return [OCSReturnValue forInvocation: self.invocation];
}

-(void) buildInvocation {
    NSMethodSignature* methodSignature = [self.instance methodSignatureForSelector: [self selector]];
    self.invocation = [NSInvocation invocationWithMethodSignature: methodSignature];
    [self.invocation setTarget: self.instance];
    [self.invocation setSelector: [self selector]];
    [self setArgsOnInvocation];
}

-(void) setArgsOnInvocation {
    for (int i=0; i<[[self argsForInvocation] count]; i++) {
        NSString* arg = [[self argsForInvocation] objectAtIndex: i];
        [self.invocation setArgument: &arg atIndex: i + 2];
    }
}

-(NSArray*) argsForInvocation {
    if ([self.args count] == [[self methodParts] count]) {
        return self.args;
    } else if ([self.args count] > 1) {
        return [NSArray arrayWithObjects: self.args, nil];
    } else {
        return [NSArray array];
    }
}

-(SEL) selector {
    return [OCSSelector selectorForString: self.methodName andArgs: self.args];
}

-(NSArray*) methodParts {
    return [OCSSelector methodParts: self.methodName];
}

@end