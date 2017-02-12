#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@class  OCSPTestReportCenter;

@interface OCSPPrincipalTestObserver : NSObject <XCTestObservation>

@property (nonatomic, strong, readonly) OCSPTestReportCenter *reportCenter;

- (XCTestSuite *)testSuite __attribute__((deprecated));


@end
