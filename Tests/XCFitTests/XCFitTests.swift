import XCTest
@testable import XCFit

class XCFitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(XCFit().text, "Thanks for Trying XCFit. Feedback Welcome")
    }


    static var allTests : [(String, (XCFitTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
