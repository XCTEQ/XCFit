//
//  XCFitAssertions.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 31/01/2017.
//
//

import Foundation
import XCTest

@available(OSX 10.11, *)
extension XCFit {
    
    open func thenIShouldSee(_ element: XCUIElement) {
        XCTAssertTrue(element.exists)
    }
    
    open func thenElemenShouldHavePlaceholderValue(_ element: XCUIElement, _ value : String) {
        XCTAssertEqual(element.placeholderValue, value)
    }
    
    open func thenElementShouldHaveTitle(_ element: XCUIElement, _ title: String) {
        XCTAssertEqual(element.title, title)
    }
    
    open func thenElementShouldBeEnabled(_ element: XCUIElement) {
        XCTAssertTrue(element.isEnabled)
    }
    
    open func thenElementShouldBeVisible(_ element: XCUIElement) {
        XCTAssertTrue(element.isVisible)
    }
    
    open func thenElementShouldBeHittable(_ element: XCUIElement) {
        XCTAssertTrue(element.isHittable)
    }
    
    open func thenElementShouldSelected(_ element: XCUIElement) {
        XCTAssertTrue(element.isSelected)
    }
    
    open func thenIShouldSeeAnAlert() {
        XCTAssertTrue(XCUIApplication().alerts.count > 1)
    }
    
}
