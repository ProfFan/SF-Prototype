import XCTest
import SwiftCheck
@testable import SwiftFusion

final class SwiftFusionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftFusion().text, "Hello, World!")
    }

    func testSieve() {
        property("All Prime") <- forAll { (n : Int) in
            return sieve(n).filter(isPrime) == sieve(n)
        }
    }

    static var allTests = [
        ("testExample", testExample),
        ("testSieve", testSieve)
    ]
}
