//
//  Waiter.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 20/10/2016.
//
//

import Foundation

import XCTest

@available(OSX 10.11, *)
class Waiter: XCFitScreen {
    
    
    func waitUntilElementExist(element: XCUIElement) {
        let exists = NSPredicate(format: "exists == true")
        self.expectation(for: exists, evaluatedWith: element, handler: nil)
        self.waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(element.exists)
    }
    
}

extension XCTestCase {
    @available(OSX 10.11, *)
    func waitForHittable(element: XCUIElement, waitSeconds: Double, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "hittable == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: waitSeconds) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailure(withDescription: message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    @available(OSX 10.11, *)
    func waitForNotHittable(element: XCUIElement, waitSeconds: Double, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "hittable == false")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: waitSeconds) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailure(withDescription: message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    
    
    
    @available(OSX 10.11, *)
    func waitForExists(element: XCUIElement, waitSeconds: Double, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: waitSeconds) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailure(withDescription: message,
                                                  inFile: file, atLine: line, expected: true)
            }
        }
    }
    
}
