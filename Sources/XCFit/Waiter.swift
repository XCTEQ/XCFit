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
