//
//  XCFitAppLauncher.swift
//  XCFit
//
//  Created by Shashikant Jagtap on 28/01/2017.
//
//

import XCTest

@available(OSX 10.11, *)
extension XCFit {
    
    open func givenILaunchedApplication() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    open func whenITerminatedApplication() {
        XCUIApplication().terminate()
    }
    
    open func givenILaunchedApplicationWithArguments(launchArguments: [[String]] = []) {
        launchArguments.forEach { XCUIApplication().launchArguments += $0 }
        XCUIApplication().launch()
    }
    
}
