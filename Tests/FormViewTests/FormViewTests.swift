import XCTest
@testable import FormView

final class FormViewTests: XCTestCase {
    
    func testCheckNotEmpty() throws {
        try testCheck(textRule: .notEmpty, trueString: "Not empty", falseString: "")
    }
    
    func testCheckMinLength() throws {
        try testCheck(textRule: .minLength(4), trueString: "1234", falseString: "123")
    }
    
    func testCheckMaxLength() throws {
        try testCheck(textRule: .maxLength(4), trueString: "1234", falseString: "123456")
    }
    
    func testCheckAtLeastOneDigit() throws {
        try testCheck(textRule: .atLeastOneDigit, trueString: "Digit 5", falseString: "No Digits")
    }
    
    func testCheckAtLeastOneLetter() throws {
        try testCheck(textRule: .atLeastOneLetter, trueString: "1234 A", falseString: "1234")
    }
    
    func testCheckDigitsOnly() throws {
        try testCheck(textRule: .digitsOnly, trueString: "1234", falseString: "1234 A")
    }
    
    func testCheckLettersOnly() throws {
        try testCheck(textRule: .lettersOnly, trueString: "Letters", falseString: "Digit 5")
    }
    
    func testCheckAtLeastOneLowercaseLetter() throws {
        try testCheck(textRule: .atLeastOneLowercaseLetter, trueString: "LOWEr", falseString: "UPPER")
    }
    
    func testCheckAtLeastOneUppercaseLetter() throws {
        try testCheck(textRule: .atLeastOneUppercaseLetter, trueString: "Upper", falseString: "lower")
    }
    
    func testCheckAtLeastOneSpecialCharacter() throws {
        try testCheck(textRule: .atLeastOneSpecialCharacter, trueString: "Special %", falseString: "No special")
    }
    
    func testCheckNoSpecialCharacters() throws {
        try testCheck(textRule: .noSpecialCharacters, trueString: "No special", falseString: "Special %")
    }
    
    func testCheckEmail() throws {
        try testCheck(textRule: .email, trueString: "alievmaxx@gmail.com", falseString: "alievmaxx@.com")
    }
    
    func testCheckNotRecurringPincode() throws {
        try testCheck(textRule: .notRecurringPincode, trueString: "1234", falseString: "5555")
    }
    
    func testRegex() throws {
        let dateRegex = "(\\d{2}).(\\d{2}).(\\d{4})"
        try testCheck(textRule: .regex(dateRegex), trueString: "21.12.2000", falseString: "21..2000")
    }
    
    private func testCheck(textRule: TextValidationRule, trueString: String, falseString: String) throws {
        let isPassed = textRule.check(value: trueString)
        let isFailed = textRule.check(value: falseString) == false
        
        XCTAssertTrue(isPassed && isFailed)
    }
}
