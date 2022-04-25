import XCTest
@testable import apiclient

final class apiclientTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(apiclient().text, "Hello, World!")
    }
}
