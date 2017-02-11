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
        elementAppeared(element)
        element.tap()
    }
    
    open func whenIDoubleTapOn(_ element: XCUIElement) {
        elementAppeared(element)
        element.doubleTap()
    }
    
    open func whenItypeTextIntoTextField(textField: XCUIElement, text: String) {
        elementAppeared(textField)
        textField.typeText(text)
    }
    
    open func whenIActOnAlert(alertTitle: String, alertButton: String) {
        XCUIApplication().alerts[alertTitle].buttons[alertButton].tap()
    }
    
    open func whenIAllowSystemAlert(alertDescription: String) {
        
        addUIInterruptionMonitor(withDescription: alertDescription) { (alert) -> Bool in
            alert.buttons["Allow"].tap()
            return true
        }
        XCUIApplication().tap()
        
    }
    
    open func whenISlideASlider(by normalisedValue: CGFloat) {
        XCUIApplication().sliders.element.adjust(toNormalizedSliderPosition: normalisedValue)
    }
    
    open func whenISelectAItemFromPicker(item: CGFloat) {
        XCUIApplication().pickerWheels.element.adjust(toNormalizedSliderPosition: item)
    }
    
    open func whenIClickLinkFromWebView(linkText: String) {
        XCUIApplication().links[linkText].tap()
    }
    
    open func whenIPressElementForDuration(_ element: XCUIElement, duration: TimeInterval) {
        elementAppeared(element)
        element.press(forDuration: duration)
    }
    
    open func whenIPressOnElementAndDragToOtherElement(_ element: XCUIElement, destinationElement: XCUIElement, duration: TimeInterval) {
        elementAppeared(element)
        element.press(forDuration: duration, thenDragTo: destinationElement)
    }
    
    open func whenIClickElementForDuration(_ element: XCUIElement, duration: TimeInterval) {
        elementAppeared(element)
        element.press(forDuration: duration)
    }
    
    open func whenIClickOnElementAndDragToOtherElement(_ element: XCUIElement, destinationElement: XCUIElement, duration: TimeInterval) {
        elementAppeared(element)
        element.press(forDuration: duration, thenDragTo: destinationElement)
    }

}


