#import "OCSlimToObjectiveCBridge.h"
#import "OCSObjectiveCtoCBridge.h"
#import "SlimListSerializer.h"

NSArray* SlimListQueryTable_ToNSArray(SlimList *self) {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    SlimList *tableContents = SlimList_GetListAt(self, 0);
    NSArray *columnHeaders = SlimList_ToNSArray(SlimList_GetListAt(tableContents, 0));
    int rowIndex = 1;
    while (rowIndex < SlimList_GetLength(tableContents)) {
        SlimList *row = SlimList_GetListAt(tableContents, rowIndex);
        NSMutableDictionary *columnValues = [[NSMutableDictionary alloc] init];
        int numberOfColumns = SlimList_GetLength(row);
        for (int colIndex = 0; colIndex < numberOfColumns; colIndex++) {
            NSString *value = SlimList_GetNSStringAt(row, colIndex);
            [columnValues setValue:value forKey:columnHeaders[colIndex]];
        }
        [result addObject:columnValues];
        rowIndex++;
    }
    return [NSArray arrayWithArray:result];
}
