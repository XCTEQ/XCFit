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
    
    func whenITap(element: XCUIElement) {
        element.tap()
    }
    
    func whenIDoubleTap(element: XCUIElement) {
        element.doubleTap()
    }
    
    func whenItypeTextIntoTextField(textField: XCUIElement, text: String) {
        textField.typeText(text)
    }
    
    func whenIActOnAlert(alertTitle: String, alertButton: String) {
        XCUIApplication().alerts[alertTitle].buttons[alertButton].tap()
    }
    
    func whenIAllowSystemAlert(alertDescription: String) {
        
        addUIInterruptionMonitor(withDescription: alertDescription) { (alert) -> Bool in
            alert.buttons["Allow"].tap()
            return true
        }
        XCUIApplication().tap()
        
    }
    
    func whenISlideASlider(by normalisedValue: CGFloat) {
        XCUIApplication().sliders.element.adjust(toNormalizedSliderPosition: normalisedValue)
    }
    
    func whenISelectAItemFromPicker(item: CGFloat) {
        XCUIApplication().pickerWheels.element.adjust(toNormalizedSliderPosition: item)
    }
    
    func whenIClickLinkFromWebView(linkText: String) {
        XCUIApplication().links[linkText].tap()
    }
    
    
}


