import XCTest

@available(OSX 10.11, *)
open class XCFit: XCTestCase {

    open func waitForElementToAppearCommpleted(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true AND hittable == true AND enabled == true")
        let xcfitExpectation = expectation(for: predicate, evaluatedWith: element,
                                           handler: nil)
        
        let result = XCTWaiter().wait(for: [xcfitExpectation], timeout: 60)
        return result == .completed
    }
    
    open func waitForElementToAppearTimedOut(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true AND hittable == true AND enabled == true")
        let xcfitExpectation = expectation(for: predicate, evaluatedWith: element,
                                           handler: nil)
        let result = XCTWaiter().wait(for: [xcfitExpectation], timeout: 60)
        return result == .timedOut
    }
    
    open func waitForElementToAppearIncorrectOrder(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true AND hittable == true AND enabled == true")
        let xcfitExpectation = expectation(for: predicate, evaluatedWith: element,
                                           handler: nil)
        let result = XCTWaiter().wait(for: [xcfitExpectation], timeout: 60)
        return result == .incorrectOrder
    }
    
    open func waitForElementToAppearinvertedFulfillment(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true AND hittable == true AND enabled == true")
        let xcfitExpectation = expectation(for: predicate, evaluatedWith: element,
                                           handler: nil)
        let result = XCTWaiter().wait(for: [xcfitExpectation], timeout: 60)
        return result == .invertedFulfillment
    }
    
    open func elementAppeared(_ element: XCUIElement) {
        let result = waitForElementToAppearCommpleted(element)
        XCTAssertTrue(result)
    }
}
