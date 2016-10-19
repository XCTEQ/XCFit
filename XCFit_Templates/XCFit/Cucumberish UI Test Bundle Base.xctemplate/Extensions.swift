//
//  Extensions.swift
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//
//

import Foundation
import XCTest

extension XCUIElement {
    
    public func tapOnceVisible(testCase: XCTestCase,
                               file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        
        testCase.expectation(for: existsPredicate,
                             evaluatedWith: self, handler: nil)
        
        testCase.waitForExpectations(timeout: 20) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(self) after 20 seconds."
                testCase.recordFailure(withDescription: message,
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
        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: 20) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailure(withDescription: message,
                                   inFile: file, atLine: line, expected: true)
            }
        }
    }
}
