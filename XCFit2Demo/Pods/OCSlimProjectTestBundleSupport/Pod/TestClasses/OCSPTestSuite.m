#import "OCSPTestSuite.h"
#import "OCSPAssertRecorder.h"
#import "OCSPJUnitXMLParser.h"
#import "OCSPPrincipalTestObserver.h"
#import "OCSPTestCaseReport.h"
#import "OCSPTestReportCenter.h"

@interface OCSPTestSuite ()
@property (nonatomic, strong) NSString *testName;
@property (nonatomic, assign) BOOL testResult;
@end

@implementation OCSPTestSuite

- (id)initWithTestCaseName:(NSString *)name result:(BOOL)result {
    
    id<OCSPAssertRecorder> recorder = [[OCSPXCAssertRecorder alloc] init];
    
    return [self initWithTestCaseName:name result:result assertRecorder:recorder];
}


- (nonnull id)initWithTestCaseName:(nonnull NSString *)name result:(BOOL)result assertRecorder:(nonnull id<OCSPAssertRecorder>)recorder {
    
    if (self == [super initWithSelector:NSSelectorFromString(name)] ) {
        
        _testName = name;
        
        _testResult = result;
        
    }
    
    return self;
}

- (void)run {
    
    
    if ( ![self isPass] ) {
        
        NSString *message = (self.errorMessage) ? self.errorMessage : @"Unspecified Acceptance Test Failure";
        
        [[[self class] assertRecorder] recordFailWithTestCase:self message:message];
        
    } else {
        
        [[[self class] assertRecorder] recordPassWithTestCase:self];
        
    }
}

- (NSString *)testCaseName {
    
    NSString *name = [[self name] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]"]];
    
    return [[name componentsSeparatedByString:@" "] lastObject];
    
}

#pragma mark - Arbitrary Test Name Forwarding Mechanism

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    if ([self respondsToSelector:aSelector]) {
        return [[self class] instanceMethodSignatureForSelector:aSelector];
    } else {
        return [super methodSignatureForSelector:@selector(run)];
    }
    
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
//    if (self.testName == nil) {
//        
//        self.testName = NSStringFromSelector(anInvocation.selector);
//        
//        NSArray *values = results[self.testName];
//        
//        self.testResult = [values[0] boolValue];
//        
//        self.errorMessage = (NSString*) values[1];
//        
//        self.assertRecorder = (OCSPAssertRecorder*) values[2];
//        
//    }
//
    
    self.testName = NSStringFromSelector(anInvocation.selector);
    
    OCSPTestCaseReport *associatedReport = reports[self.testName];
    
    self.testResult = associatedReport.passed;
    
    self.errorMessage = associatedReport.errorMessage;
    
//    if  ( anInvocation.selector == NSSelectorFromString(self.testName) ) {
    
        anInvocation.selector = @selector(run);
        
//    }
    
    [anInvocation invokeWithTarget:self];
    
}

#pragma mark -- Experimental Dev

static NSMutableDictionary<NSString*,OCSPTestCaseReport*> *reports;

+ (void)initialize {
    
    [super initialize];
    
}

+ (NSArray *)testInvocations {

    reports = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *invocations = [[NSMutableArray alloc] init];
    
    [[[self reportCenter] testCaseReports] enumerateObjectsUsingBlock:^(OCSPTestCaseReport * _Nonnull report, NSUInteger idx, BOOL * _Nonnull stop) {
    
        NSInvocation *invocation = [self invocationForTestCaseReport:report];
        
        [invocations addObject:invocation];
        
        reports[NSStringFromSelector(invocation.selector)] = report;
        
    }];
    
    return [NSArray arrayWithArray:invocations];
}

+ (NSInvocation *)invocationForTestCaseReport:(OCSPTestCaseReport *)report {
    
    SEL selector = NSSelectorFromString(report.name);
    
    //        NSMethodSignature *dummySig = [self instanceMethodSignatureForSelector:@selector(dummyTest)];
    
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    invocation.selector = selector;
    
    return invocation;
    
}

+ (OCSPTestReportCenter *) reportCenter {
    
    static OCSPTestReportCenter *reportCenter = nil;
    
    if (nil == reportCenter) {
        
        reportCenter = [[OCSPTestReportCenter alloc] init];
        
    }
    
    return reportCenter;
}

+ (id<OCSPAssertRecorder>)assertRecorder {
    
    static id<OCSPAssertRecorder> assertRecorder = nil;
    
    if (nil == assertRecorder) {
        
        assertRecorder = [[OCSPXCAssertRecorder alloc] init];
        
    }
    
    return assertRecorder;
}

@end


