#import <Foundation/Foundation.h>

@interface OCSPTestCaseReport : NSObject

@property (nonatomic, strong, nonnull) NSString *name;

@property (nonatomic, assign) BOOL passed;

@property (nonatomic, strong, nonnull) NSString *errorMessage;

- (nonnull id)initWithTestCaseName:(nonnull NSString *)name result:(BOOL)result;

@end



