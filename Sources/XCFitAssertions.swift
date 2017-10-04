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
        XCTContext.runActivity(named: "Then I Should See \(element)") { _ in
            XCTAssertTrue(element.exists)
        }
    }

    open func thenElemenShouldHavePlaceholderValue(_ element: XCUIElement, _ value : String) {
        XCTContext.runActivity(named: "Then Element Should Have Placeholder Value \(value)") { _ in
             XCTAssertEqual(element.placeholderValue, value)
        }
    }

    open func thenElementShouldHaveTitle(_ element: XCUIElement, _ title: String) {
        XCTContext.runActivity(named: "Then Element Should Have Title \(title)") { _ in
            XCTAssertEqual(element.title, title)
        }
    }

    open func thenElementShouldBeEnabled(_ element: XCUIElement) {
        XCTContext.runActivity(named: "Then Element Should Be Enabled") { _ in
            XCTAssertTrue(element.isEnabled)
        }
    }

    open func thenElementShouldBeVisible(_ element: XCUIElement) {
        XCTContext.runActivity(named: "Then Element \(element) Should Be Visible") { _ in
           XCTAssertTrue(element.isHittable)
        }
    }

    open func thenElementShouldBeHittable(_ element: XCUIElement) {
        XCTContext.runActivity(named: "Then Element \(element) Should Be Hittable") { _ in
            XCTAssertTrue(element.isHittable)
        }
    }

    open func thenElementShouldSelected(_ element: XCUIElement) {
        XCTContext.runActivity(named: "Then Element \(element) Should Be Selected") { _ in
            XCTAssertTrue(element.isSelected)
        }
    }

    open func thenIShouldSeeAnAlert() {
        XCTContext.runActivity(named: "Then Should See An Alert") { _ in
            XCTAssertTrue(XCUIApplication().alerts.count > 1)
        }
    }

}
