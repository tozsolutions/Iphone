import XCTest
@testable import iPhoneCore

final class StringExtensionsTests: XCTestCase {
    
    func testEmailValidation() {
        // Valid emails
        XCTAssertTrue("test@example.com".isValidEmail)
        XCTAssertTrue("user.name@example.org".isValidEmail)
        XCTAssertTrue("user+tag@example.net".isValidEmail)
        
        // Invalid emails
        XCTAssertFalse("invalid-email".isValidEmail)
        XCTAssertFalse("@example.com".isValidEmail)
        XCTAssertFalse("test@".isValidEmail)
    }
    
    func testTrimmed() {
        XCTAssertEqual("  hello world  ".trimmed, "hello world")
        XCTAssertEqual("\n\ttest\n\t".trimmed, "test")
        XCTAssertEqual("nospace".trimmed, "nospace")
    }
    
    func testIsBlank() {
        XCTAssertTrue("".isBlank)
        XCTAssertTrue("   ".isBlank)
        XCTAssertTrue("\n\t".isBlank)
        XCTAssertFalse("hello".isBlank)
        XCTAssertFalse("  hello  ".isBlank)
    }
    
    func testLocalized() {
        // This test assumes the string exists in the localization files
        let testString = "test_key"
        XCTAssertEqual(testString.localized, NSLocalizedString(testString, comment: ""))
    }
}