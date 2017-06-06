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
        let result = waitForElementToAppearCommpleted(element)
        XCTAssertTrue(result)
    }

    open func whenIexpectElementTimeOut(_ element: XCUIElement) {
        let result = waitForElementToAppearTimedOut(element)
        XCTAssertTrue(result)
    }

    open func whenIexpectElementIncorrectOrder(_ element: XCUIElement) {
        let result = waitForElementToAppearIncorrectOrder(element)
        XCTAssertTrue(result)
    }

    open func whenIexpectElementInvertedFulfillment(_ element: XCUIElement) {
        let result = waitForElementToAppearinvertedFulfillment(element)
        XCTAssertTrue(result)
    }
}
