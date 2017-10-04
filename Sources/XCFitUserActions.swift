//
//  XCFitUserActions.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 28/01/2017.
//
//

import XCTest

@available(OSX 10.11, *)
extension XCFit {

    open func whenITap(on element: XCUIElement) {
        XCTContext.runActivity(named: "When I Tap \(element)") { _ in
            elementAppeared(element)
            element.tap()
        }
    }

    open func whenIDoubleTapOn(_ element: XCUIElement) {
        XCTContext.runActivity(named: "When I Double Tap On \(element)") { _ in
            elementAppeared(element)
            element.doubleTap()
        }
    }

    open func whenItypeTextIntoTextField(textField: XCUIElement, text: String) {
        XCTContext.runActivity(named: "When I Type Text \(text) Into TextField \(textField)") { _ in
            elementAppeared(textField)
            textField.typeText(text)
        }
    }

    open func whenIActOnAlert(alertTitle: String, alertButton: String) {
        XCTContext.runActivity(named: "When I Act on Alert \(alertTitle) with Button \(alertButton)") { _ in
            XCUIApplication().alerts[alertTitle].buttons[alertButton].tap()
        }
    }

    open func whenIAllowSystemAlert(alertDescription: String) {

        addUIInterruptionMonitor(withDescription: alertDescription) { (alert) -> Bool in
            alert.buttons["Allow"].tap()
            return true
        }
        XCUIApplication().tap()

    }

    open func whenISlideASlider(by normalisedValue: CGFloat) {
        XCTContext.runActivity(named: "When I Slide A Slider by value \(normalisedValue)") { _ in
            XCUIApplication().sliders.element.adjust(toNormalizedSliderPosition: normalisedValue)
        }
    }

    open func whenISelectAItemFromPicker(item: CGFloat) {
        XCTContext.runActivity(named: "When I Select A Item \(item) from Picker") { _ in
            XCUIApplication().pickerWheels.element.adjust(toNormalizedSliderPosition: item)
        }
    }

    open func whenIClickLinkFromWebView(linkText: String) {
        XCTContext.runActivity(named: "When I Click Link \(linkText) from WebView") { _ in
            XCUIApplication().links[linkText].tap()
        }
    }

    open func whenIPressElementForDuration(_ element: XCUIElement, duration: TimeInterval) {
        XCTContext.runActivity(named: "When I Press Element \(element) For Duration \(duration)") { _ in
            elementAppeared(element)
            element.press(forDuration: duration)
        }
    }

    open func whenIPressOnElementAndDragToOtherElement(_ element: XCUIElement, destinationElement: XCUIElement, duration: TimeInterval) {
        
        XCTContext.runActivity(named: "When I Press Element \(element) and Drag to other element \(destinationElement)") { _ in
            elementAppeared(element)
            element.press(forDuration: duration, thenDragTo: destinationElement)
        }
    }

    open func whenIClickElementForDuration(_ element: XCUIElement, duration: TimeInterval) {
        XCTContext.runActivity(named: "When I Click Element \(element) For Duration \(duration)") { _ in
            elementAppeared(element)
            element.press(forDuration: duration)
        }
    }

    open func whenIClickOnElementAndDragToOtherElement(_ element: XCUIElement, destinationElement: XCUIElement, duration: TimeInterval) {
        XCTContext.runActivity(named: "When I Click on Element \(element) and Drag to other element \(destinationElement)") { _ in
            elementAppeared(element)
            element.press(forDuration: duration, thenDragTo: destinationElement)
        }
    }

}
