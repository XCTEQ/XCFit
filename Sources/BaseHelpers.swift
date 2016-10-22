////
////  BaseHelpers.swift
////  XCFit
////
////  Created by Shashikant Jagtap on 22/10/2016.
////
////
//
//import Foundation
//import XCTest
//
//@available(OSX 10.11, *)
//extension XCUIElement {
//    func bnr_longPress() {
//        let duration: TimeInterval = 0.6
//        pressForDuration(duration)
//    }
//}
//
//class BasePage: XCTestCase {
//    
//    func clickTablex(_ text: String){
//        if #available(OSX 10.11, *) {
//            let app = XCUIApplication()
//        } else {
//            // Fallback on earlier versions
//        }
//        waitForElementToAppear(app.navigationBars.buttons[text])
//        app.navigationBars.buttons[text].tap()
//    }
//    
//    static func clickTables(_ text: String){
//        let tablesQuery = XCUIApplication().tables
//        tablesQuery.staticTexts[text].tap()
//    }
//    
//    static func clickBackButton(_ buttontext: String){
//        let app = XCUIApplication()
//        app.navigationBars.buttons[buttontext].tap()
//    }
//    
//    static func longpress(_ idx: UInt){
//        let cells = XCUIApplication().tables.cells
//        let staticTextOfFirstCell = cells.element(boundBy: idx)
//            .staticTexts.element(boundBy: idx)
//        staticTextOfFirstCell.bnr_longPress()
//    }
//    
//    fileprivate func waitForElementToAppear(_ element: XCUIElement,
//                                            file: String = #file, line: UInt = #line) {
//        let existsPredicate = NSPredicate(format: "exists == true")
//        expectation(for: existsPredicate,
//                    evaluatedWith: element, handler: nil)
//        
//        waitForExpectations(timeout: 5) { (error) -> Void in
//            if (error != nil) {
//                let message = "Failed to find \(element) after 5 seconds."
//                self.recordFailure(withDescription: message,
//                                   inFile: file, atLine: line, expected: true)
//            }
//        }
//    }
//    
//}
