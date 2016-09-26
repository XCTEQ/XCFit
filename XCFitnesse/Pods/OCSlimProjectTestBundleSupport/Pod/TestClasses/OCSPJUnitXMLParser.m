#import "OCSPJUnitXMLParser.h"

@interface OCSPJUnitXMLParser () <NSXMLParserDelegate>

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSString *testSuiteName;
@property (nonatomic, assign) NSUInteger testSuiteErrorCount;
@property (nonatomic, assign) NSUInteger testCaseCount;
@property (nonatomic, assign) NSUInteger failedTestSuiteCount;
@property (nonatomic, assign) BOOL parseErrorOccured;
@property (nonatomic, assign) BOOL parsingSucceeded;
@property (nonatomic, strong) NSMutableArray<NSString *> *testCaseNames;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *testCaseResults;
@property (nonatomic, strong) NSMutableArray<id> *testErrorMessages;

@end

@implementation OCSPJUnitXMLParser

NSError *__autoreleasing * outErrorRef;

- (id)init {
    
    return [self initWithXMLData:[NSData data]];
    
}

- (id)initWithXMLData:(nonnull NSData *) data {
    
    if (self == [super init]) {
    
        _data = data;
        
        _testSuiteName = [[NSNull null] description];
        
    }
    
    return self;
    
}

- (void)parse {
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.data];
    
    parser.delegate = self;
    
    self.parsingSucceeded = [parser parse];
        
}

- (BOOL) result {
    
    return self.failedTestSuiteCount == 0;
    
}


- (NSString *) testNameForTestCaseAtIndex:(NSUInteger)index {
    
    return (index < self.testCaseNames.count) ? self.testCaseNames[index] : nil;
    
}

- (BOOL)testResultForTestCaseAtIndex:(NSUInteger)index {
    
    return [self.testCaseResults[index] boolValue];
    
}

- (nullable NSString *)testErrorMessageForTestCaseAtIndex:(NSUInteger)index {
    
    NSObject *object = self.testErrorMessages[index];
    
    return ([[NSNull null] isEqual:object]) ? nil : (NSString *)object;
    
}

//MARK: NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    self.parseErrorOccured = YES;
    
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(nonnull NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:@"testsuite"]) {
        
        [self takeTestSuiteResultsFromTestSuiteElementAttributes:attributeDict];
        
    }
    
    if ([elementName isEqualToString:@"testcase"]) {
        
        [self takeTestCaseNameFromTestCaseElementAttributes:attributeDict];
        
        [self appendPassTestResult];
        
        [self appendNullTestErrorMessage];
    }
    
    
    if ( [@[@"failure", @"error"] indexOfObject:elementName] != NSNotFound ) {
        
        [self updateTestResultFailFromElementAttributes:attributeDict];
    }
    
    
    
}

- (void)takeTestSuiteResultsFromTestSuiteElementAttributes:(nonnull NSDictionary *) attributeDict {
    
    self.testSuiteName = attributeDict[@"name"];
    
    [self takeTestCaseCountFromElementAttributes:attributeDict];
    
    [self takeTestSuiteFailuresFromElementAttributes:attributeDict];
    
    [self takeTestSuiteErrorsFromElementAttributes:attributeDict];
    
}

- (void) takeTestCaseCountFromElementAttributes:(NSDictionary*)attributeDict {
    
    NSUInteger count = [[attributeDict objectForKey:@"tests"] integerValue];
    
    self.testCaseCount = count;
    
}

- (void) takeTestSuiteFailuresFromElementAttributes:(NSDictionary*)attributeDict {
    
    NSUInteger failuresCount = [[attributeDict objectForKey:@"failures"] integerValue];
    
    self.failedTestSuiteCount += failuresCount;
    
}

- (void) takeTestSuiteErrorsFromElementAttributes:(NSDictionary*)attributeDict {
    
    NSUInteger errorsCount = [[attributeDict objectForKey:@"errors"] integerValue];
    
    self.testSuiteErrorCount += errorsCount;
}

- (void) takeTestCaseNameFromTestCaseElementAttributes:(NSDictionary*)attributesDict {
    
    NSString* name = (NSString *) attributesDict[@"name"];
    
    if (!self.testCaseNames) {
        
        self.testCaseNames = [NSMutableArray arrayWithObject:name];
        
    } else {
        
        [self.testCaseNames addObject:name];
    }
}


- (void)appendPassTestResult {
    
    if (!self.testCaseResults) {
        
        self.testCaseResults = [NSMutableArray arrayWithObject:@YES];
        
    } else {
        
        [self.testCaseResults addObject:@YES];
    }
    
}

- (void)appendNullTestErrorMessage {
    
    if (!self.testErrorMessages) {
        
        self.testErrorMessages = [NSMutableArray arrayWithObject:[NSNull null]];
        
    } else {
        
        [self.testErrorMessages addObject:[NSNull null]];
    }
    
}

- (void)updateTestResultFailFromElementAttributes:(NSDictionary *)attributeDict {
    
    NSUInteger lastTestResultIndex = [self.testCaseResults indexOfObject:self.testCaseResults.lastObject];
    
    [self.testCaseResults replaceObjectAtIndex:lastTestResultIndex withObject:@NO];
    
    
    NSString *message = attributeDict[@"message"];
    
    [self.testErrorMessages replaceObjectAtIndex:lastTestResultIndex withObject:message];
    
}
@end
