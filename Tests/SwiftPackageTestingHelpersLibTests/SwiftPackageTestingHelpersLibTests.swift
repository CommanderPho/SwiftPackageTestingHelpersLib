import XCTest
@testable import SwiftPackageTestingHelpersLib

final class SwiftPackageTestingHelpersLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPackageTestingHelpersLib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
