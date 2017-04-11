//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.

This file stores all the XCUIElements for the perticular screen or feature so that our steps become readable.

 */


import Foundation
import XCTest

enum FeatureElements {
    
    static let helloButton = XCUIApplication().buttons["hello"]
    static let welcomeText = XCUIApplication().staticTexts["Welcome"]
    
}
