#import "OCSPTestCaseReport.h"

@implementation OCSPTestCaseReport

- (id)initWithTestCaseName:(NSString *)name result:(BOOL)result {
    
    if (self == [super init] ) {
        
        _name = name;
        
        _passed = result;
        
    }
    
    return self;
}

@end
