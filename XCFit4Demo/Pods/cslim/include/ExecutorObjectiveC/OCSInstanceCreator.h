#import <Foundation/Foundation.h>

@interface OCSInstanceCreator : NSObject

+(id) instanceWithClassName:(NSString*) givenClassName
                    andArgs:(NSArray*) givenArgs;

-(id) create;

-(NSString*) result;

@end
