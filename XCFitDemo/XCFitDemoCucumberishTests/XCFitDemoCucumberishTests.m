//
//
//  Created by XcodeBDDfire.
//  Copyright © 2016 XcodeBDDfire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XCFitDemoCucumberishTests-Swift.h"
#import <XCTest/XCTest.h>


__attribute__((constructor))
void CucumberishInit()
{
    [XCFitDemoCucumberishTests CucumberishSwiftInit];
    
}