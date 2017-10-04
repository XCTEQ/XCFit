//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.

This is extension to Feature protocol to implement the steps in the given when then format.

 */

import Foundation
import XCTest
//import XCFit

// Once XCFit is imported we can use predefined steps if needed

extension Feature {

    func whenIswipeLeft() {
        XCTContext.runActivity(named: "When I Swipe Left") { _ in
                XCUIApplication().swipeLeft()
        }
    }

    func whenITapHomeButton() {
        XCTContext.runActivity(named: "When I Tap Home Button") { _ in
            FeatureScreen.homeButton.button.tap()
        }
    }
}
