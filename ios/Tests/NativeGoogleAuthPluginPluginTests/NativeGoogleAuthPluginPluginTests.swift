import XCTest
@testable import NativeGoogleAuthPluginPlugin

class NativeGoogleAuthPluginTests: XCTestCase {
    func testPluginInitializes() {
        let implementation = NativeGoogleAuthPlugin()
        XCTAssertNotNil(implementation)
    }
}
