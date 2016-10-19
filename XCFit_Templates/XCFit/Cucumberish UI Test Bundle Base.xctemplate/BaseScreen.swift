//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

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
