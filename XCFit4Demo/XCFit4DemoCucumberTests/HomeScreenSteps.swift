//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.

 Here is Step implementation for the HomeScreen where we can use buttons from HomeScreen. We have to implement all the steps in the func HomeScreenSteps Or create another func if needed but we have register it in the intitialiser class.
 */

import Foundation
import XCTest
import Cucumberish

class HomeScreenSteps: BaseScreen {

    func HomeScreenSteps() {

        MatchAll("I should see hello message") { (args, userInfo) -> Void in

            XCTAssertTrue(XCUIApplication().staticTexts["Welcome"].exists)

        }

    }
}
