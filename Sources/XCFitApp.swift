//
//  XCFitApp.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 22/10/2016.
//
//

// TODO: Fix Tap which is not working

import Foundation
import XCTest

//extension XCUIElement {
//    func btn_longPress() {
//        let duration: NSTimeInterval = 0.6
//        pressForDuration(duration)
//    }
//    func btn_TouchUpInside() {
//        tap()
//    }
//}

extension XCTestCase {
    @available(OSX 10.11, *)
    func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 30,  file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
            }
        }
    }
}

extension String {
    func containsString(subString:String) -> Bool {
        if self.range(of: subString) != nil{
            return true
        }
        return false
    }
}

struct XCApp {

    @available(OSX 10.11, *)
    static func initApp(app:XCUIApplication?, force:Bool=false) -> XCUIApplication {
        // FIX:
        if(app==nil || force) {
            let myApp = XCUIApplication()
            myApp.launch()
            return myApp
        } else {
            return app!
        }
    }

    @available(OSX 10.11, *)
    static func printAppStats (app:XCUIApplication?) -> Void {
        let myApp  = XCApp.initApp(app: app)

        var stats = ""

        // Visible UIButtons
        stats += "# UIButtons count : \(myApp.buttons.count)\n"
        for index in 0..<myApp.buttons.count {
            stats += " - Btn \(index): \(myApp.buttons.element(boundBy: index).label)\n"
        }

        // Visible UILabels
        stats += "# UILabels count : \(myApp.staticTexts.count)\n"
        for index in 0..<myApp.staticTexts.count {
            stats += " - UILabel \(index): [\(myApp.staticTexts.element(boundBy: index).label)]\n"
        }

        // Visible TabBar Buttons (only in TabBar aplications)
        stats += "# TabBar count : \(myApp.tabBars.count)\n"
        for index in 0..<myApp.tabBars.count {
            stats += " - TabBar \(index): [\(myApp.tabBars.element(boundBy: index).label)]\n"
        }

        // Visible UIAlertView Controllers
        stats += "# Alerts count : \(myApp.alerts.count)\n"
        for index in 0..<myApp.alerts.count {
            stats += " - Alert \(index): [\(myApp.alerts.element(boundBy: index).label)]\n"
        }

        print(stats)
    }
    struct UIAlertViewController {
        @available(OSX 10.11, *)
        static func existsWith(app:XCUIApplication?, alertTitle:String, button1Title:String, button2Title:String, pressButton1:Bool=false, pressButton2:Bool=false) {

            let myApp = XCApp.initApp(app: app)

            // Validate Alert Title

            XCTAssertEqual(myApp.alerts.count, 1)
            let alert = myApp.alerts.element(boundBy: 0)
            XCTAssert(alert.label == alertTitle)

            // Validate Alert Options

            var numberOfButtons = 0
            if(!button1Title.isEmpty) {
                numberOfButtons += 1
            }
            if(!button2Title.isEmpty) {
                numberOfButtons += 1
            }


            // The number os buttons we have, should be equal to the number os options we have
            XCTAssert(alert.collectionViews.buttons.count == UInt(numberOfButtons))

            if(!button1Title.isEmpty) {
                // Check the firt alert option
                let button1 = alert.collectionViews.buttons.element(boundBy: 0)
                XCTAssert(button1.label ==  button1Title)
            }

            if(!button2Title.isEmpty) {
                let button2 = alert.collectionViews.buttons.element(boundBy: 1)
                XCTAssert(button2.label ==  button2Title)
            }

            // Choose some option

            XCTAssert(!(pressButton2 && pressButton1), "Pick one or other")

//            if(pressButton1) {
//                // Exit alert
//                myApp.alerts.elementBoundByIndex(0).collectionViews.buttons.elementBoundByIndex(0).tap();
//            }
//
//            if(pressButton2) {
//                myApp.alerts.elementBoundByIndex(0).collectionViews.buttons.elementBoundByIndex(1).tap();
//            }

        }
    }
    struct TabBar {
        @available(OSX 10.11, *)
        static func selectTabAtIndex(app:XCUIApplication?, index:UInt) -> XCUIApplication {
            let myApp    = XCApp.initApp(app: app)
            let tabBtn   = myApp.tabBars.buttons.element(boundBy: index)
            let notFound = "\(tabBtn)".containsString(subString: "'XCUIElement' is not a member type of 'XCTest'")
            if(notFound) {
                XCTAssert(false, "Element with index '\(index)' was not found")
            }
//            tabBtn.tap()
            return myApp
        }
        @available(OSX 10.11, *)
        static func selectTabWithName(app:XCUIApplication?, name:String) -> XCUIApplication {
            let myApp    = XCApp.initApp(app: app)
            let tabBtn   = myApp.tabBars.buttons[name]
            let notFound = "\(tabBtn)".containsString(subString: "'XCUIElement' is not a member type of 'XCTest'")
            if(notFound) {
                XCTAssert(false, "Element with name '\(name)' was not found")
            }
//            tabBtn.tap()
            return myApp
        }
    }

    struct UISlider {
        @available(OSX 10.11, *)
        static func findAndTapTheOneWithText(app:XCUIApplication?, btnText:String) -> XCUIApplication {
            let myApp      = XCApp.initApp(app: app)
            //let btnPressMe = myApp.buttons[btnText]
//            btnPressMe.btn_TouchUpInside()
            return myApp
        }
    }

    struct UIButton {
        @available(OSX 10.11, *)
        static func findAndTapTheOneWithText(app:XCUIApplication?, btnText:String) -> XCUIApplication {
            let myApp      = XCApp.initApp(app: app)
            //let btnPressMe = myApp.buttons[btnText]
//            btnPressMe.btn_TouchUpInside()
            return myApp
        }
    }

    struct Screen {
        @available(OSX 10.11, *)
        static func existsLabelWithText(app:XCUIApplication?, someText:String) -> XCUIApplication {
            let myApp  = XCApp.initApp(app: app)
            let sucess = myApp.staticTexts[someText].exists
            if(!sucess) {
                // Test will fail!
                XCApp.printAppStats(app: app)
            }
            XCTAssert(sucess)
            return myApp
        }
        @available(OSX 10.11, *)
        static func existsButtonWithText(app:XCUIApplication?, someText:String) -> XCUIApplication {
            let myApp  = XCApp.initApp(app: app)
            let sucess = myApp.buttons[someText].exists
            if(!sucess) {
                // Test will fail!
                XCApp.printAppStats(app: app)
            }
            XCTAssert(sucess)
            return myApp
        }
    }


}
