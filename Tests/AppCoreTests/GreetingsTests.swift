import XCTest
@testable import AppCore

final class GreetingsTests: XCTestCase {
    func testHelloDefault() {
        XCTAssertEqual(Greetings.hello(), "Hello, iOS!")
    }

    func testHelloWithName() {
        XCTAssertEqual(Greetings.hello("Chayan"), "Hello, Chayan!")
    }
}
