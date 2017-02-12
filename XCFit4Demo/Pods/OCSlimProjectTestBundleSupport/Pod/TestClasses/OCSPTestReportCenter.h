#import <Foundation/Foundation.h>

@class OCSPJUnitXMLParser;
@class OCSPTestCaseReport;

@interface OCSPTestReportCenter : NSObject

@property (nonatomic, assign) BOOL xctoolCompatibilityDisabled;
@property (nonatomic, assign) BOOL xcodeFixDisappearingTestCaseByAppendingDummyTest;

@property (nonatomic, readonly, nonnull) NSString *testSuiteName;

- (nonnull NSArray <OCSPTestCaseReport*>  *  )testCaseReports;

@end
