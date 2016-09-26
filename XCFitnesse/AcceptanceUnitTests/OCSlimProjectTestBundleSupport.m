//
//  OCSlimProjectTestBundleSupport.m
//  OCSlimProjectTestBundleSupport
//
//  Created by OCSlimProject on 25/09/2016.
//  MIT License
//  © 2016 Paul Stringer
//
//

#if __has_include(<OCSlimProjectTestBundleSupport/OCSPTestSuite.h>)
#else
#pragma GCC error "Target requires pod 'OCSlimProjectTestBundleSupport'. Add the entry \"pod 'OCSlimProjectTestBundleSupport'\" to your Podfile configuration."
#endif

/* Copy and paste this entry to your projects Podfile and run 'pod install' or 'pod update' as necessary

 target 'AcceptanceUnitTests' do
    platform :ios, 9.0
    pod 'OCSlimProjectTestBundleSupport'
 end
 
  https://cocoapods.org/?q=OCSlimProjectTestBundleSupport

*/