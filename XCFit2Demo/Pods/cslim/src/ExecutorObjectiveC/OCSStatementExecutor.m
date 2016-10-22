#import "OCSStatementExecutor.h"
#import "OCSSymbolDictionary.h"
#import "OCSInstanceCreator.h"
#import "OCSMethodCaller.h"
#import "OCSException.h"

static OCSStatementExecutor* sharedExecutor = NULL;

@interface OCSStatementExecutor ()

@property (nonatomic, strong) OCSSymbolDictionary* symbolDictionary;
@property (nonatomic, strong) NSMutableDictionary* instances;

@end

@implementation OCSStatementExecutor

+(id) sharedExecutor {
    if (sharedExecutor == NULL) {
        sharedExecutor = [self new];
    }
    return sharedExecutor;
}

-(id) init {
    if ((self = [super init])) {
        [self reset];
    }
    return self;
}

-(void) reset {
    self.instances = [NSMutableDictionary dictionary];
    self.symbolDictionary = [OCSSymbolDictionary new];
}

-(id) getInstanceWithName:(NSString*) instanceName {
    return [self.instances valueForKey: instanceName];
}

-(void) removeInstanceWithName:(NSString*) instanceName {
    [self.instances removeObjectForKey: instanceName];
    
}

-(void) setSymbol:(NSString*) symbol toValue:(NSString*) value {
    [self.symbolDictionary setSymbol: symbol toValue: value];
}

-(NSString*) makeInstanceWithName:(NSString*) instanceName
                        className:(NSString*) className
                          andArgs:(NSArray*) args {
    OCSInstanceCreator* ocsInstance;
    ocsInstance = [OCSInstanceCreator instanceWithClassName: [self.symbolDictionary replaceSymbolsInString: className]
                                                    andArgs: [self.symbolDictionary replaceSymbolsInArray: args]];
    id createdInstance = [ocsInstance create];
    [self.instances setValue: createdInstance forKey: instanceName];
    return [ocsInstance result];
}

-(NSString*) callMethod:(NSString*) methodName
     onInstanceWithName:(NSString*) instanceName
               withArgs:(NSArray*) args {
    id instance = [self getInstanceWithName: instanceName];
    if (instance == NULL) {
        return [[self instanceMissingException: instanceName] stringValue];
    } else {
        OCSMethodCaller* methodCaller = [OCSMethodCaller withInstance: instance
                                                           methodName: methodName
                                                              andArgs: [self.symbolDictionary replaceSymbolsInArray: args]];
        return [methodCaller call];
    }
}

-(OCSException*) instanceMissingException:(NSString*) instanceName {
    return [OCSException exceptionWithMessage: @"The instance %@. does not exist", instanceName];
}

@end
