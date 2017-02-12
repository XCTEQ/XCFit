//
//  CommonStepDefinitions.swift
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//

/*
This is sample code created by XCFit Framework and can be edited/Removed as needed.

 This class has some mostly used step definitions included here. You can add some more here if needed.

 */

import XCTest
import Cucumberish

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

        MatchAll("I launched an App") { (args, userInfo) in
            application.launch()
         }

         MatchAll("I terminated an App") { (args, userInfo) in
             application.terminate()
         }

         MatchAll("^I see an alert with title \"([^\\\"]*)\" and clicked \"([^\\\"]*)\" action$") { (args, userInfo) in

             let alert = application.alerts[(args?[0])!]
             alert.buttons[(args?[0])!].tap()

         }

         MatchAll("^I allow system alert with  \"([^\\\"]*)\" description$") { (args, userInfo) in

             let alertDescription = args?[0]

             XCTestCase().addUIInterruptionMonitor(withDescription: alertDescription!) { (alert) -> Bool in
                 alert.buttons["Allow"].tap()
                 return true
             }
             XCUIApplication().tap()
         }

         MatchAll("^I slide a slider by  \"([^\\\"]*)\" normalised Value$") { (args, userInfo) in

             let sliderPosition = args?[0]
             let slidervalue :CGFloat = CGFloat((sliderPosition! as NSString).doubleValue)

             application.sliders.element.adjust(toNormalizedSliderPosition: slidervalue)

         }

         MatchAll("^I select an item \"([^\\\"]*)\" from picker$") { (args, userInfo) in

             let pickerPosition = args?[0]
             application.pickerWheels.element.adjust(toPickerWheelValue: pickerPosition!)
         }

         MatchAll("^I click link \"([^\\\"]*)\" from webview$") { (args, userInfo) in

             let linkText = args?[0]
             application.links[linkText!].tap()
         }

         MatchAll("^I should see menubar with \"([^\\\"]*)\" header$") { (args, userInfo) in

             let menubarText = args?[0]
             XCTAssertTrue(application.menuBars[menubarText!].exists)
         }

         MatchAll("^I should see menu with \"([^\\\"]*)\" items$") { (args, userInfo) in

             let menuCount = args![0]
             let expectedMenuCount: UInt = UInt(menuCount)!
             let appMenuCount = application.menus.count
             XCTAssertEqual(expectedMenuCount, appMenuCount, "Comparing MenuCount")
         }

         MatchAll("^I should see screen with \"([^\\\"]*)\" cells$") { (args, userInfo) in

             let cellCount = args![0]
             let expectedCellCount: UInt = UInt(cellCount)!
             let appCellCount = application.cells.count
             XCTAssertEqual(expectedCellCount, appCellCount, "Comparing  Cell Count")
         }

         MatchAll("^I check \"([^\\\"]*)\" checkbox$") { (args, userInfo) in
             let checkBox = args?[0]
             application.checkBoxes[checkBox!].tap()
         }


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

        //When/And/But/When I write "London" in the "City" field
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
