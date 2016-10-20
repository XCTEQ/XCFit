//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//

/*
 
 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.
 
 This file can take all the Swift extensions build around XCUI Test Frameworks which can be directly used in the tests, page objects. Here are sample extensions on XCUIElement and XCTestCase.
 
 */



import Foundation
import XCTest

extension XCUIElement {
    
    public func tapOnceVisible(testCase: XCTestCase,
                               file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        
        testCase.expectationForPredicate(existsPredicate,
                                         evaluatedWithObject: self, handler: nil)
        
        testCase.waitForExpectationsWithTimeout(20) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(self) after 20 seconds."
                testCase.recordFailureWithDescription(message,
                                                      inFile: file, atLine: line, expected: true)
            }
        }
        
        self.tap()
    }
    
    
}

extension XCTestCase {
    func waitForElementToAppear(element: XCUIElement,
                                file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate,
                                evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(20) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailureWithDescription(message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }
}
