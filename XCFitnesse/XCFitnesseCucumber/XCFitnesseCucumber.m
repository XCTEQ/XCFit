//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XCFitnesseCucumber-Swift.h"
#import <XCTest/XCTest.h>


__attribute__((constructor))
void CucumberishInit()
{
    [XCFitnesseCucumber CucumberishSwiftInit];
    
}