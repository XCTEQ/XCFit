//
//  XCFitWaiter.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 28/01/2017.
//
//

import XCTest
import Foundation

@available(OSX 10.11, *)
extension XCFit {

    open func whenIExpectElementToAppear(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) to appear") { _ in
            let result = waitForElementToAppearCompleted(element)
            XCTAssertTrue(result)
        }
    }

    open func whenIExpectElementTimeOut(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) to Timeout") { _ in
            let result = waitForElementToAppearTimedOut(element)
            XCTAssertTrue(result)
        }
    }

    open func whenIExpectElementIncorrectOrder(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) in incorrect order") { _ in
            let result = waitForElementToAppearIncorrectOrder(element)
            XCTAssertTrue(result)
        }
    }

    open func whenIExpectElementInvertedFulfillment(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) in Inverted Fullfillment") { _ in
            let result = waitForElementToAppearinvertedFulfillment(element)
            XCTAssertTrue(result)
        }
    }
}
