#import <Foundation/Foundation.h>

// Slim Decision Table
// http://www.fitnesse.org/FitNesse.UserGuide.WritingAcceptanceTests.SliM.DecisionTable

@protocol SlimDecisionTable <NSObject>

@optional
- (void)table:(NSArray*)table;
- (void)beginTable;
- (void)endTable;
- (void)reset;
@required
- (void)execute;

@end

// Slim Query Table
// http://www.fitnesse.org/FitNesse.UserGuide.WritingAcceptanceTests.SliM.QueryTable

@protocol SlimQueryTable <NSObject>

@optional
- (void)table:(NSArray*)table;
@required
- (NSArray*)query;

@end