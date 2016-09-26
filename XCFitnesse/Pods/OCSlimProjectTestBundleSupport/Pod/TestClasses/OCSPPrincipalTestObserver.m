#import "OCSPPrincipalTestObserver.h"

#import "OCSPTestSuite.h"
#import "OCSPTestReportCenter.h"
#import "OCSPTestCaseReport.h"

@interface OCSPPrincipalTestObserver ()

@property (nonatomic, strong) NSString *bundleTestSuiteName;
@property (nonatomic, strong) OCSPTestReportCenter *reportCenter;
@property (nonatomic, strong) NSArray *testCaseReports;

@end

@implementation OCSPPrincipalTestObserver

- (id)init {
    
    if (self == [super init]) {
        
        _reportCenter = [[OCSPTestReportCenter alloc] init];
        
        [[XCTestObservationCenter sharedTestObservationCenter] addTestObserver:self];
       
    }
    
    return self;
}

#pragma mark - XCTestObservation

- (void)testBundleWillStart:(NSBundle *)testBundle {
    
    [self registerHostTestBundle:testBundle];
    
}

- (void)testSuiteWillStart:(XCTestSuite *)testSuite {
    
    if ( [self isHostTestSuite:testSuite] ) {
    
        XCTestSuite *acceptanceTestSuite = self.testSuite;
    
        [testSuite addTest:acceptanceTestSuite];
        
    }
    
}

- (void)testBundleDidFinish:(NSBundle *)testBundle {
    
    [[XCTestObservationCenter sharedTestObservationCenter] removeTestObserver:self];
    
}

#pragma mark - Private

#pragma mark - Identifing Target Test Bundle

- (void)registerHostTestBundle:(NSBundle *)bundle {
    
    self.bundleTestSuiteName = [[bundle bundleURL] lastPathComponent];

}

- (BOOL)isHostTestSuite:(XCTestSuite *)suite {
    
    return [[suite name] isEqualToString:self.bundleTestSuiteName];
}

#pragma mark - Test Suite Building

- (XCTestSuite *)testSuite {
    
    NSString *testSuiteName = [self.reportCenter testSuiteName];
    
    XCTestSuite *acceptanceTestSuite = [XCTestSuite testSuiteWithName:testSuiteName];
    
    
    for (int i = 0; i < self.testCaseReports.count; i++ ) {
    
        XCTestCase *testCase = [self testCaseForIndex:i];

        [acceptanceTestSuite addTest:testCase];
    
    }
    
    return acceptanceTestSuite;

}

#pragma mark Test Suite Building Helpers

- (XCTestCase *)testCaseForIndex:(NSUInteger)i {
    
    OCSPTestCaseReport *report = self.testCaseReports[i];
    
    OCSPTestSuite *testCase = [[OCSPTestSuite alloc] initWithTestCaseName:report.name result:report.passed];
    
    testCase.errorMessage = report.errorMessage;
    
    return testCase;
    
}

- (NSArray <OCSPTestCaseReport *> *) testCaseReports {
    
    if ( nil == _testCaseReports ) {
        
//        self.reportCenter.xcodeFixDisappearingTestCaseByAppendingDummyTest = self.xcodeFixDisappearingTestCaseByAppendingDummyTest;
        
        _testCaseReports = [self.reportCenter testCaseReports];
        
    }
    
    return _testCaseReports;
    
}


@end

