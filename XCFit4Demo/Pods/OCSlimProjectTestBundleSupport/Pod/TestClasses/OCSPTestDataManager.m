#import "OCSPTestDataManager.h"
#import "OCSPTestReportReader.h"

@implementation OCSPTestDataManager

static NSBundle *_bundle;

+ (void)initialize {
    
    _bundle = [NSBundle bundleForClass:self];
    
}

+ (NSString *)failedResultPath {
    
//    NSString *path = [_bundle pathForResource:@"SuiteTestResultFailures" ofType:@"xml"];
//    
//    NSParameterAssert(path);
    
    return [self pathForXMLFileResourceNamed:@"SuiteTestResultFailures"];
    
}

+ (NSData *)failedResultData {
    
    return [NSData dataWithContentsOfFile:[self failedResultPath]];
    
}

+ (NSString *)successResultPath {
    
    return [self pathForXMLFileResourceNamed:@"SuiteTestResultSuccess"];
    
//    NSString *path = [_bundle pathForResource:@"SuiteTestResultSuccess" ofType:@"xml"];
//    
//    NSParameterAssert(path);
//    
//    return path;
    
}

+ (NSData *)successResultData {
    
    return [NSData dataWithContentsOfFile:[self successResultPath]];
    
}


+ (NSString *)errorResultPath {
    
    return [self pathForXMLFileResourceNamed:@"SuiteTestResultErrors"];
    
//    NSString *path = [_bundle pathForResource:@"SuiteTestResultErrors" ofType:@"xml"];
//    
//    NSParameterAssert(path);
//    
//    return path;
    
}

+ (NSData *)errorResultData {
    
    return [NSData dataWithContentsOfFile:[self errorResultPath]];
    
}

+ (NSData *)failedResultDataByAppendingHyphenatedFilenameModifier:(NSString *)modifier {
    
    return  [self resultDataAtPath:[self failedResultPath] byAppendingHyphenatedFilenameModifier:modifier];
}

+ (NSData *)successResultDataByAppendingHyphenatedFilenameModifier:(NSString *)modifier {
    
    return  [self resultDataAtPath:[self successResultPath] byAppendingHyphenatedFilenameModifier:modifier];
    
}

+ (NSData *)resultDataAtPath:(NSString *)path byAppendingHyphenatedFilenameModifier:(NSString *)modifier {
    
    if (modifier) {
        
        path = [self path:path byAppendingHypenatedFilenameSuffix:modifier];
        
    }
    
    return [NSData dataWithContentsOfFile:path];
    
}

+ (NSString *)path:(NSString*)path byAppendingHypenatedFilenameSuffix:(NSString *)suffix {
    
    NSString *pathExtension = [path pathExtension];
    
    NSString *filenameSuffix = [NSString stringWithFormat:@"-%@",suffix];
    
    return [[[path stringByDeletingPathExtension] stringByAppendingString:filenameSuffix] stringByAppendingPathExtension:pathExtension];
    
}

+ (NSData *)fitnesseTestReportData {
    
    NSString  *fitnesseReportPath = [_bundle pathForResource:@"Fitnesse-Test-Report" ofType:@"xml"];
    
    return [NSData dataWithContentsOfFile: fitnesseReportPath];
    
}

+ (NSString *)pathForXMLFileResourceNamed:(NSString *)resource {
 
    NSString *path = [_bundle pathForResource:resource ofType:@"xml"];
    
    NSParameterAssert(path);
    
    return path;
    
}

@end


/// OCSlimFitnesseTestReportReaderStub ///

@interface OCSlimFitnesseTestReportReaderStub : NSObject <OCSPTestReportReader>

@property (nonatomic, strong) NSData *data;

- (id)initWithData:(NSData*)data;

@end

@implementation OCSlimFitnesseTestReportReaderStub

- (id)initWithData:(NSData*)data {
    
    if (self = [super init] ) {
        
        _data = data;
    }
    
    return self;
}

- (NSData *)read {
    
    return self.data;
}

@end


void createDefaultTestReportReaderWithData(NSData *data) {
    
    id<OCSPTestReportReader> reader = [[OCSlimFitnesseTestReportReaderStub alloc] initWithData:data];
    
    [OCSPTestReportReader setDefaultReader: reader];
    
}