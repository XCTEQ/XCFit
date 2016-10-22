//
//  CommonStepDefinitions.swift
//  Originally Created Ahmed Ali [ Cucumberish] and  re-written by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//

/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 This class has some mostly used step definitions included here. You can add some more here if needed. 
 
 */

import XCTest

class CommonStepDefinitions: NSObject {
    
    fileprivate var application : XCUIApplication!
    
    fileprivate func elementByLabel(_ label : String, type: String) -> XCUIElement
    {
        var elementQurey : XCUIElementQuery!
        switch(type){
        case "button":
            elementQurey = application.buttons
        case "label":
            elementQurey = application.staticTexts
        case "tab":
            elementQurey = application.tabs
        case "field", "text field":
            elementQurey = application.textFields
        case "textView", "text view":
            elementQurey = application.textViews
        case "view":
            elementQurey = application.otherElements
        default: elementQurey = application.otherElements
        }
        return elementQurey[label]
    }
    
    fileprivate func setup(_ application: XCUIApplication)
    {
        self.application = application
        //And/When/Then/But I tap the "Header" view
        MatchAll("^I tap (?:the )?\"([^\\\"]*)\" (button|label|tab|view|field|textView)$") { (args, userInfo) -> Void in
            let label = args?[0]
            let type = args?[1]
            self.elementByLabel(label!, type: type!).tap()
        }
        
        //And/When/Then/But I tap the "Increment" button 5 times
        MatchAll("^I tap (?:the )?\"([^\\\"]*)\" (button|label|tab|view) ([1-9]{1}) time(?:s)?$") { (args, userInfo) -> Void in
            let label = args?[0]
            let type = args?[1]
            let times = NSString(string: (args?[2])!).integerValue
            let element = self.elementByLabel(label!, type: type!)
            for _ in 0 ..< times{
                element.tap()
            }
        }
        //             Then I write "Ahmed Ali" into the "Name" field
        
        //When/And/But/When I write "Ahmed" in the "Name" field
        MatchAll("^I write \"([^\\\"]*)\" (?:into|in) (?:the )?\"([^\\\"]*)\" (field|text view)$") { (args, userInfo) -> Void in
            let type = args?[2]
            let label = args?[1]
            let element = self.elementByLabel(label!, type: type!)
            element.tap()
            element.typeText((args?[0])!)
        }
        
        
        MatchAll("^I switch (on|off) the \"([^\\\"]*)\" switch$") { (args, userInfo) -> Void in
            let theSwitch = application.switches[(args?[1])!]
            let currentValu = NSString(string: theSwitch.value as! String).integerValue
            let newValue = args?[0] == "on" ? 1 : 0
            if(currentValu != newValue){
                theSwitch.tap()
            }
            
        }
        
        
    }
    
    class func setup(_ application: XCUIApplication)
    {
        CommonStepDefinitions().setup(application)
    }
}
