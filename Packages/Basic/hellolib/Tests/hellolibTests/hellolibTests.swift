import XCTest
@testable import hellolib

final class hellolibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(hellolib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
