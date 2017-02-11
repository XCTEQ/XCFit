//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

/*
This is sample code created by XCFit Framework and can be edited/Removed as needed.

This is objective-C contructor to initialise Cucumberish in our project.

 */




#import <Foundation/Foundation.h>
#import "XCFit4DemoCucumberTests-Swift.h"
#import <XCTest/XCTest.h>


__attribute__((constructor))
void CucumberishInit()
{
    [XCFit4DemoCucumberTests CucumberishSwiftInit];

}
