#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@protocol OCSPAssertRecorder <NSObject>

- (void)recordFailWithTestCase:(XCTestCase * _Nonnull)test message:(NSString * _Nonnull)message;
- (void)recordPassWithTestCase:(XCTestCase* _Nonnull)test;

@end

@interface OCSPXCAssertRecorder : NSObject <OCSPAssertRecorder>


@end

@interface OCSPAssertRecorderSpy : NSObject <OCSPAssertRecorder>

@property (nonatomic, strong, nullable) NSString *didRecordFailMessage;
@property (nonatomic, assign) BOOL didRecordFail;
@property (nonatomic, assign) BOOL didRecordPass;

@end
