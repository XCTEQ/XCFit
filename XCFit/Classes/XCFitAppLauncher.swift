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
    
    func givenILaunchedApplication() {
        super.setUp()
        XCUIApplication().launch()
    }
    
    func whenITerminatedApplication() {
        XCUIApplication().terminate()
    }
    
    func givenILaunchedApplicationWithArguments(launchArguments: [[String]] = []) {
        launchArguments.forEach { XCUIApplication().launchArguments += $0 }
        XCUIApplication().launch()
    }
    
}
