//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 This assumes that your apps is made up of multiple screens. All the common varibales, functions, related to screens can be put here. This class will be perent class of your individual screen.
 
 */

import XCTest
import Foundation

class BaseScreen: XCTestCase {
    
    func waitAndTap(element: XCUIElement) {
        
        let exists = NSPredicate(format: "exists == true")
        
        self.expectation(for: exists, evaluatedWith: element, handler: nil)
        self.waitForExpectations(timeout: 10, handler: nil)
        
        element.tap()
        
    }
    
    
    func waitForExist(element: XCUIElement) {
        
        let exists = NSPredicate(format: "exists == true")
        
        self.expectation(for: exists, evaluatedWith: element, handler: nil)
        self.waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(element.exists)
        
    }
}
