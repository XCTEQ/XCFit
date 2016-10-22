//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 This assumes that your apps is made up of multiple screens. You can write individual screen class which extend BaseScreen. All the functionality related to screen can be included in this class.
 */

import Foundation
import XCTest


class HomeScreen: BaseScreen {
    
    // You can add locators and functions of homeScreen here
    
   let crappyButtuon = XCUIApplication().buttons["I am really useless button"]
    
}
