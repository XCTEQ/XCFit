//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//


/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 This is very important file as we will be using it as initialiser of all out test suite. We have to resgister all our Step Definitions in this class. e.g we have registed CommonStepDefinitions and HomeScreenSteps here 
 
 */


import Foundation
import XCTest
class XCFit2DemoCucumberTests: NSObject {
    class func CucumberishSwiftInit()
    {
        var application : XCUIApplication!
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
            application = XCUIApplication()
            CommonStepDefinitions.setup(application);
            HomeScreenSteps().HomeScreenSteps()
        }
        //A Given step definition
        Given("the app is running") { (args, userInfo) -> Void in
            application.launch()
            
        }
        //Tell Cucumberish the name of your features folder and let it execute them for you...
        Cucumberish.executeFeatures(inDirectory: "Features", includeTags: nil, excludeTags: nil)
    }
}
