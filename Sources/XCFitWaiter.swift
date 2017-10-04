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

    open func whenIexpectElementToAppear(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) to appear") { _ in
            let result = waitForElementToAppearCommpleted(element)
            XCTAssertTrue(result)
        }
    }

    open func whenIexpectElementTimeOut(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) to Timeout") { _ in
            let result = waitForElementToAppearTimedOut(element)
            XCTAssertTrue(result)
        }
    }

    open func whenIexpectElementIncorrectOrder(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) in incorrect order") { _ in
            let result = waitForElementToAppearIncorrectOrder(element)
            XCTAssertTrue(result)
        }
    }

    open func whenIexpectElementInvertedFulfillment(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Expect Element \(element) in Inverted Fullfillment") { _ in
            let result = waitForElementToAppearinvertedFulfillment(element)
            XCTAssertTrue(result)
        }
    }
}
