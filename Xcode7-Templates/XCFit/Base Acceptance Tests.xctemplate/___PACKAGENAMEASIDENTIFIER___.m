//
//  ___FILENAME___
//  ___POD_NAME___
//
//  Created by OCSlimProject on ___DATE___.
//  MIT License
//  © 2016 Paul Stringer
//


#import <Foundation/Foundation.h>

#if __has_include(<___POD_NAME___/___POD_NAME___.h>)
#else
#pragma GCC error "Target requires pod '___POD_NAME___'. Add the entry \"pod '___POD_NAME___'\" to your Podfile configuration."
#endif

/* Copy and paste this entry to your projects Podfile and run 'pod install' or 'pod update' as necessary
 
 target '___PACKAGENAMEASIDENTIFIER___' do
    platform :___POD_PLATFORM_IDENTIFIER___
    pod '___POD_NAME___'
 end
 
 
 https://cocoapods.org/?q=___POD_NAME___
 
 */

@interface ___PACKAGENAMEASIDENTIFIER___ : NSObject
@end
@implementation ___PACKAGENAMEASIDENTIFIER___
@end