#import "OCSSymbolDictionary.h"

@interface OCSSymbolDictionary ()

@property(nonatomic, strong) NSMutableDictionary* symbols;

@end

@implementation OCSSymbolDictionary

-(id) init {
    if ((self = [super init])) {
        self.symbols = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void) setSymbol:(NSString*) symbol toValue:(NSString*) value {
    [self.symbols setObject: value forKey: symbol];
}

-(NSString*) replaceSymbolsInString:(NSString*) givenString {
    NSString* newString = givenString;
    for(NSString* symbol in [[self.symbols keyEnumerator] allObjects]) {
        newString = [newString stringByReplacingOccurrencesOfString: [NSString stringWithFormat: @"$%@", symbol]
                                                         withString: [self.symbols objectForKey: symbol]];
    }
    return newString;
}

-(NSDictionary*) replaceSymbolsInDictionary:(NSDictionary*) givenDictionary {
    NSMutableDictionary *newDictionary = [[NSMutableDictionary alloc] init];
    [givenDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *newString = [self replaceSymbolsInString:(NSString *)obj];
        [newDictionary setValue:newString forKey:key];
    }];
    return [NSDictionary dictionaryWithDictionary:newDictionary];
}

-(NSArray*) replaceSymbolsInArray:(NSArray*) args {
    NSMutableArray* updatedArgs = [NSMutableArray array];
    for (id arg in args) {
        if ([arg isKindOfClass:[NSString class]]) {
            [updatedArgs addObject: [self replaceSymbolsInString: arg]];
        } else if ([arg isKindOfClass:[NSArray class]]) {
            [updatedArgs addObject: [self replaceSymbolsInArray:arg] ];
        } else if ([arg isKindOfClass:[NSDictionary class]]) {
            [updatedArgs addObject: [self replaceSymbolsInDictionary:arg] ];
        } else {
            [updatedArgs addObject:arg];
        }
    }
    return updatedArgs;
}

@end
