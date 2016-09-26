#import <Foundation/Foundation.h>

@interface OCSSymbolDictionary : NSObject

-(void) setSymbol:(NSString*) symbol toValue:(NSString*) value;

-(NSString*) replaceSymbolsInString:(NSString*) givenString;
-(NSArray*) replaceSymbolsInArray:(NSArray*) args;

@end
