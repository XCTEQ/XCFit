#import <Foundation/Foundation.h>

@protocol OCSPTestReportReader <NSObject>
    
- (NSData * _Nonnull) read;
    
@end


@interface OCSPTestReportReader : NSObject

+ (id<OCSPTestReportReader> _Nonnull) defaultReader;

+ (void)setDefaultReader:(id<OCSPTestReportReader> _Nonnull)reader;

@end


/// OCSlimFitnesseTestReportFileReaderTests ///

@interface OCSPTestReportFileReader : NSObject <OCSPTestReportReader>

@end