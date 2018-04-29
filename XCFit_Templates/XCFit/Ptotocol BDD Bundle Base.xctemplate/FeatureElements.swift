//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.

This file stores all the XCUIElements for the screen or feature in the Swift enum

 */


import Foundation
import XCTest

enum FeatureScreen: String {

case homeButton = "Home"

    var button: XCUIElement {
        switch self {
        case .homeButton:
          if UIDevice.current.userInterfaceIdiom == .pad {
               return XCUIApplication().buttons["iPadHome"]
           } else {
               return XCUIApplication().buttons[self.rawValue]
          }
        }
    }
}
