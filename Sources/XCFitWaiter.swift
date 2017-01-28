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
class XCFitWaiter: XCFit {
    
    func waitUntilElementExist(element: XCUIElement) {
        let exists = NSPredicate(format: "exists == true")
        self.expectation(for: exists, evaluatedWith: element, handler: nil)
        self.waitForExpectations(timeout: 10, handler: nil)
        XCTAssert(element.exists)
    }
    
}

@available(OSX 10.11, *)
extension XCUIElement {

    func waitAndTap(testCase: XCTestCase, file: String = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "exists == true AND hittable == true AND enabled == true")
        wait(with: testCase, for: predicate, file: file, line: line)
        tap()
    }
    
    func waitForAppearance(testCase: XCTestCase, file: String = #file, line: UInt = #line) {
        wait(with: testCase, for: NSPredicate(format: "exists == true"), file: file, line: line)
    }
    
    func waitForDisappearance(testCase: XCTestCase, file: String = #file, line: UInt = #line) {
        wait(with: testCase, for: NSPredicate(format: "exists == false"), file: file, line: line)
        
    }
    
    private func wait(with testCase: XCTestCase, for predicate: NSPredicate, file: String = #file, line: UInt = #line) {
        let timeout: TimeInterval = 90
        testCase.expectation(for: predicate, evaluatedWith: self, handler: nil)
        testCase.waitForExpectations(timeout: timeout) { error in
            guard error != nil else { return }
            let message = "Failed to find \(self) after \(timeout) seconds."
            testCase.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
        }
    }
    
}

extension XCTestCase {
    @available(OSX 10.11, *)
    func waitForElementToAppearOnScreen(element: XCUIElement,
                                        file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate,
                    evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: 20) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailure(withDescription: message,
                                   inFile: file, atLine: line, expected: true)
            }
        }
    }
}

@available(iOS 9.0, OSX 10.11, *)

extension XCUIElement {
    
    public var isVisible: Bool {
        return exists && !frame.isEmpty && XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
    }
    
}

@available(OSX 10.11, *)
public extension XCTestCase {
    /**
     * Waits for the default timeout until `element.exists` is true.
     *
     * @param element the element you are waiting for
     * @see waitForElementToNotExist()
     */
    @available(OSX 10.11, *)
    func waitForElementToExist(element: XCUIElement) {
        waitForElement(element: element, toExist: true)
    }
    
    /**
     * Waits for the default timeout until `element.exists` is false.
     *
     * @param element the element you are waiting for
     * @see waitForElementToExist()
     */
    @available(OSX 10.11, *)
    func waitForElementToNotExist(element: XCUIElement) {
        waitForElement(element: element, toExist: false)
    }
    
    /**
     * Waits for the default timeout until the activity indicator stop spinning.
     *
     * @note Should only be used if one `ActivityIndicator` is present.
     */
    func waitForActivityIndicatorToFinish() {
        
        let spinnerQuery = XCUIApplication().activityIndicators
        
        let expression = { () -> Bool in
            return (spinnerQuery.element.value! as AnyObject).integerValue != 1
        }
        waitFor(expression: expression, failureMessage: "Timed out waiting for spinner to finish.")
    }
    
    // MARK: Private
    
    @available(OSX 10.11, *)
    private func waitForElement(element: XCUIElement, toExist: Bool) {
        let expression = { () -> Bool in
            return element.exists == toExist
        }
        waitFor(expression: expression, failureMessage: "Timed out waiting for element to exist.")
    }
    
    private func waitFor(expression: () -> Bool, failureMessage: String) {
        let startTime = NSDate.timeIntervalSinceReferenceDate
        
        while (!expression()) {
            if (NSDate.timeIntervalSinceReferenceDate - startTime > 2.0) {
                raiseTimeOutException(message: failureMessage)
            }
            CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 0.1, Bool(0))
        }
    }
    
    private func raiseTimeOutException(message: String) {
        NSException(name: NSExceptionName(rawValue: "Timeout Failure"), reason: message, userInfo: nil).raise()
    }
}

extension XCTestCase {
    @available(OSX 10.11, *)
    func waitForHittable(element: XCUIElement, waitSeconds: Double, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "hittable == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: waitSeconds) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailure(withDescription: message,
                                   inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    @available(OSX 10.11, *)
    func waitForNotHittable(element: XCUIElement, waitSeconds: Double, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "hittable == false")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: waitSeconds) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailure(withDescription: message,
                                   inFile: file, atLine: line, expected: true)
            }
        }
    }
    
    
    
    
    @available(OSX 10.11, *)
    func waitForExists(element: XCUIElement, waitSeconds: Double, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        
        waitForExpectations(timeout: waitSeconds) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(waitSeconds) seconds."
                self.recordFailure(withDescription: message,
                                   inFile: file, atLine: line, expected: true)
            }
        }
    }
    
}
