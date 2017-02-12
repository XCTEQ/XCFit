#import "OCSPLocalizedMessageTable.h"

@implementation OCSPLocalizedMessageTable

+ (NSString*) localizedEmptyTestSuiteMessageWithSuiteName:(NSString *) suiteName {

    return [self localizedMessageWithKey:@"EmptyTestSuiteErrorMessage"
                                argument:suiteName];
    
}

+ (NSString *)localizedTestPageMessageWithUnderlyingMessage:(NSString *) underlyingMessage {
    
    return [self localizedMessageWithKey:@"TestPageErrorMessage"
                                argument:underlyingMessage];
    
}

+ (NSString *)localizedTestSuiteParsingErrorMessage {
    
    return [self localizedMessageWithKey:@"TestSuiteParsingErrorMessage" argument:nil];
}

+ (nonnull NSString *) localizedTestSuiteReportDataNotFound {
    
    return [self localizedMessageWithKey:@"TestSuiteDataNotFound" argument:nil];
    
}

+ (nonnull NSString *) localizedTestSuiteErrorsOccurredMessageWithCount:(NSUInteger)errorCount {
    
    return [self localizedMessageWithKey:@"TestSuiteErrorsOccurred" argument:[@(errorCount) stringValue]];
}

+ (NSString *)localizedMessageWithKey:(NSString*)key argument:(NSString*)arg {
    
    NSString *localizedString = NSLocalizedStringFromTableInBundle(key, nil, [NSBundle bundleForClass:[self class]], nil);
    
    NSString *message = [NSString stringWithFormat:localizedString, arg, nil];
    
    return message;
}

@end
