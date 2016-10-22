#import "StatementExecutor.h"
#import "OCSStatementExecutor.h"
#import "OCSObjectiveCtoCBridge.h"
#import "OCSlimToObjectiveCBridge.h"
#import "SlimListSerializer.h"

NSArray *NSArrayOf(SlimList *args, char const* methodName)  {
    if (strcmp(methodName, "table")==0) {
        return @[SlimListQueryTable_ToNSArray(args)];
    } else {
        return SlimList_ToNSArray(args);
    }
}

StatementExecutor* StatementExecutor_Create(void) {
    [[OCSStatementExecutor sharedExecutor] reset];
	return nil;
}

void* StatementExecutor_Instance(StatementExecutor* executor, char const* instanceName) {
    return (__bridge void *)([[OCSStatementExecutor sharedExecutor] getInstanceWithName: CStringToNSString(instanceName)]);
}

char* StatementExecutor_Make(StatementExecutor* executor, char const* instanceName, char const* className, SlimList* args) {
    return NSStringToCString([[OCSStatementExecutor sharedExecutor] makeInstanceWithName: CStringToNSString(instanceName)
                                                                               className: CStringToNSString(className)
                                                                                 andArgs: SlimList_ToNSArray(args)]);
}

char* StatementExecutor_Call(StatementExecutor* executor, char const* instanceName, char const* methodName, SlimList* args) {
    return NSStringToCString([[OCSStatementExecutor sharedExecutor] callMethod: CStringToNSString(methodName)
                                                            onInstanceWithName: CStringToNSString(instanceName)
                                                                      withArgs: NSArrayOf(args, methodName)]);
}

void StatementExecutor_SetSymbol(StatementExecutor* self, char const* symbol, char const* value) {
    [[OCSStatementExecutor sharedExecutor] setSymbol: CStringToNSString(symbol)
                                             toValue: CStringToNSString(value)];
}

void StatementExecutor_Destroy(StatementExecutor* self) {
}
void StatementExecutor_AddFixture(StatementExecutor* executor, Fixture fixture) {
}
void StatementExecutor_RegisterFixture(StatementExecutor* executor, char const * className, Constructor constructor, Destructor destructor){
}
void StatementExecutor_RegisterMethod(StatementExecutor* executor, char const * className, char const * methodName, Method method){
}


