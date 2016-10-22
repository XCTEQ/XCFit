#import <Foundation/Foundation.h>

@interface OCSPTestDataManager : NSObject

+ (NSData *)failedResultData;

+ (NSData *)failedResultDataByAppendingHyphenatedFilenameModifier:(NSString *)modifier;

+ (NSData *)successResultData;

+ (NSData *)successResultDataByAppendingHyphenatedFilenameModifier:(NSString *)modifier;

+ (NSData *)errorResultData;

+ (NSData *)fitnesseTestReportData;

void createDefaultTestReportReaderWithData(NSData *data);

@end


