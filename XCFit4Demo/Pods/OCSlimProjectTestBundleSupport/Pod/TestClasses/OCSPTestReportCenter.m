#import "OCSPTestReportCenter.h"
#import "OCSPJUnitXMLParser.h"
#import "OCSPLocalizedMessageTable.h"
#import "OCSPTestCaseReport.h"
#import "OCSPTestReportReader.h"

@interface OCSPTestReportCenter ()

@property (nonatomic, strong) OCSPJUnitXMLParser *parser;

@end

@implementation OCSPTestReportCenter

- (NSString *)testSuiteName {
    
    return [self.parser testSuiteName];
    
}

- (NSArray *)testCaseReports {
    
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:self.parser.testCaseCount];
    
    for (int i = 0; i < [self.parser testCaseCount]; i++ ) {
        
        OCSPTestCaseReport *report = [self testCaseReportForIndex:i];
        
        [results addObject:report];
        
    }
    
    [self appendExceptionReportTestCases:results];
    
    [self appendDisappearingTestCaseUIFixWithReports:results];
    
    return results;
    
}

#pragma mark - Private

- (OCSPJUnitXMLParser *)parser {
    
    if (nil == _parser) {
        
        NSData *data = [[OCSPTestReportReader defaultReader] read];
        
        _parser = [[OCSPJUnitXMLParser alloc] initWithXMLData:data];
        
        [_parser parse];
        
    }
    
    return _parser;
    
}

#pragma mark - Custom Reports

- (OCSPTestCaseReport*)tearDownTestCaseReport {
    
    OCSPTestCaseReport *report = [[OCSPTestCaseReport alloc] init];
    
    report.name = @"tearDown";
    
    report.passed = YES;
    
    return report;
}

- (OCSPTestCaseReport *)testCaseReportForIndex:(NSUInteger)i {
    
    OCSPTestCaseReport *report = [self reportWithParserResultAtIndex:i];
    
    [self updateReportWithXCToolCompatibleName:report];

    return report;
    
}

- (OCSPTestCaseReport *)reportWithParserResultAtIndex:(NSUInteger )i {
    
    OCSPTestCaseReport *report = [[OCSPTestCaseReport alloc] init];
    
    report.name = [self.parser testNameForTestCaseAtIndex:i];
    
    report.passed = [self.parser testResultForTestCaseAtIndex:i];
    
    NSString *message = [self errorMessageForTestCaseReportAtIndex:i];
    
    report.errorMessage = message;
    
    return report;
}

- (NSString *)errorMessageForTestCaseReportAtIndex:(NSUInteger )index {
    
    NSString *testPageErrorMessage = [self.parser testErrorMessageForTestCaseAtIndex:index];
    
    NSString *message = [OCSPLocalizedMessageTable localizedTestPageMessageWithUnderlyingMessage:testPageErrorMessage];
    
    return message;
    
}

#pragma mark - Exception As Failing Test Reports

- (void)appendExceptionReportTestCases:(NSMutableArray *) reports {
    
    OCSPTestCaseReport *reportingTestCase = nil;
    
    NSString *message = nil;
    
    if ( self.parser.parseErrorOccured == YES ) {
        
        reportingTestCase = [[OCSPTestCaseReport alloc] initWithTestCaseName:@"TestSuiteReportXMLParsingSucceeded" result:NO];
        
        message = [OCSPLocalizedMessageTable localizedTestSuiteParsingErrorMessage];
        
    } else if ( self.parser.parsingSucceeded == NO) {
        
        reportingTestCase = [[OCSPTestCaseReport alloc] initWithTestCaseName:@"TestSuiteReportDataExists" result:NO];
        
        message = [OCSPLocalizedMessageTable localizedTestSuiteReportDataNotFound];
        
    } else if ( [self testSuiteIsEmpty] ) {
        
        NSString *testCaseName = [NSString stringWithFormat:@"%@TestCaseCountGreaterThanZero", [self.parser testSuiteName]];
        
        reportingTestCase = [[OCSPTestCaseReport alloc] initWithTestCaseName:testCaseName result:NO];
        
        message = [OCSPLocalizedMessageTable localizedEmptyTestSuiteMessageWithSuiteName:[self.parser testSuiteName]];
        
    } else if ( [self testSuiteFailedToRun] ) {
        
        NSString *testCaseName = [NSString stringWithFormat:@"%@ErrorCountEqualsZero", [self.parser testSuiteName]];
        
        reportingTestCase = [[OCSPTestCaseReport alloc] initWithTestCaseName:testCaseName result:NO];
        
        message = [OCSPLocalizedMessageTable localizedTestSuiteErrorsOccurredMessageWithCount:self.parser.testSuiteErrorCount];
        
    }
    
    
    
    
    if ( reportingTestCase ) {
        
        [reportingTestCase setErrorMessage:message];
     
        [reports addObject:reportingTestCase];
        
    }
    
}

- (BOOL)testSuiteIsEmpty {
    
    return self.parser.parsingSucceeded == YES && self.parser.testCaseCount == 0 && self.parser.testSuiteErrorCount == 0;
    
}

- (BOOL)testSuiteFailedToRun {
    
    BOOL errorsOccuredOutsideOfTests = self.parser.testSuiteErrorCount > self.parser.testCaseCount;
    
    return self.parser.parsingSucceeded == YES && errorsOccuredOutsideOfTests;
    
}


#pragma mark - Xcode/XCTool Fixes


- (void)appendDisappearingTestCaseUIFixWithReports:(NSMutableArray<OCSPTestCaseReport*>*)testCaseReports {
    
    if (!self.xcodeFixDisappearingTestCaseByAppendingDummyTest) {
        
        [testCaseReports addObject:[self tearDownTestCaseReport]];
        
    }
    
}

- (void)updateReportWithXCToolCompatibleName:(OCSPTestCaseReport *)report {
    
    if (!self.xctoolCompatibilityDisabled) {
        
        report.name = [report.name stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    }
    
}

@end
