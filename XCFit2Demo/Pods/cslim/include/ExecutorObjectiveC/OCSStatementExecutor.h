#import <Foundation/Foundation.h>

@interface OCSStatementExecutor : NSObject

+(id) sharedExecutor;
-(void) reset;

-(id) getInstanceWithName:(NSString*) instanceName;

-(void) removeInstanceWithName:(NSString*) instanceName;

-(NSString*) makeInstanceWithName:(NSString*) instanceName
                        className:(NSString*) className
                          andArgs:(NSArray*) args;

-(NSString*) callMethod:(NSString*) methodName
     onInstanceWithName:(NSString*) instanceName
               withArgs:(NSArray*) args;

-(void) setSymbol:(NSString*) symbol toValue:(NSString*) value;

@end
