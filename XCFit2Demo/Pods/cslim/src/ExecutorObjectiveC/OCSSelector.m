#import "OCSSelector.h"

@interface OCSSelector ()

@property (nonatomic, strong) NSString* methodName;
@property (nonatomic, strong) NSArray* args;

@end

@implementation OCSSelector

+(SEL) selectorForString:(NSString*) methodName andArgs:(NSArray*) args {
    return [[[self alloc] initWithString: methodName andArgs: args] getSelector];
}

-(id) initWithString:(NSString*) methodName andArgs:(NSArray*) args {
    if ((self = [super init])) {
        self.methodName = methodName;
        self.args = args;
    }
    return self;
}

-(SEL) getSelector {
    if ([self isArgsEmpty]) {
        return NSSelectorFromString([self methodName]);
    } else {
        return NSSelectorFromString([self multipartMethodName]);
    }
}

-(BOOL) isArgsEmpty {
    return [self.args count] == 0;
}

-(NSString*) multipartMethodName {
    NSString* multiMethodName = [[self methodParts] componentsJoinedByString: @":"];
    return [multiMethodName stringByAppendingString: @":"];
}

+(NSArray*) methodParts:(NSString *) methodName {
    return [[[self alloc] initWithString: methodName andArgs: NULL] methodParts];
}

-(NSArray*) methodParts {
    return [self.methodName componentsSeparatedByString: @","];
}

@end