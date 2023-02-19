//
//  TextValidationRuleTests.swift
//
//
//  Created by Maxim Aliev on 07.02.2023.
//

import XCTest
@testable import FormView

final class TextValidationRuleTests: XCTestCase {
    
    func testIgnoreEmpty() throws {
        try test(textRule: .digitsOnly, trueString: "", falseString: "1234 A")
    }
    
    func testNotEmpty() throws {
        try test(textRule: .notEmpty, trueString: "Not empty", falseString: "")
    }
    
    func testMinLength() throws {
        try test(textRule: .minLength(4), trueString: "1234", falseString: "123")
    }
    
    func testMaxLength() throws {
        try test(textRule: .maxLength(4), trueString: "1234", falseString: "123456")
    }
    
    func testAtLeastOneDigit() throws {
        try test(textRule: .atLeastOneDigit, trueString: "Digit 5", falseString: "No Digits")
    }
    
    func testAtLeastOneLetter() throws {
        try test(textRule: .atLeastOneLetter, trueString: "1234 A", falseString: "1234")
    }
    
    func testDigitsOnly() throws {
        try test(textRule: .digitsOnly, trueString: "1234", falseString: "1234 A")
    }
    
    func testLettersOnly() throws {
        try test(textRule: .lettersOnly, trueString: "Letters", falseString: "Digit 5")
    }
    
    func testAtLeastOneLowercaseLetter() throws {
        try test(textRule: .atLeastOneLowercaseLetter, trueString: "LOWEr", falseString: "UPPER")
    }
    
    func testAtLeastOneUppercaseLetter() throws {
        try test(textRule: .atLeastOneUppercaseLetter, trueString: "Upper", falseString: "lower")
    }
    
    func testAtLeastOneSpecialCharacter() throws {
        try test(textRule: .atLeastOneSpecialCharacter, trueString: "Special %", falseString: "No special")
    }
    
    func testNoSpecialCharacters() throws {
        try test(textRule: .noSpecialCharacters, trueString: "No special", falseString: "Special %")
    }
    
    func testEmail() throws {
        try test(textRule: .email, trueString: "alievmaxx@gmail.com", falseString: "alievmaxx@.com")
    }
    
    func testNotRecurringPincode() throws {
        try test(textRule: .notRecurringPincode, trueString: "1234", falseString: "5555")
    }
    
    func testRegex() throws {
        let dateRegex = "(\\d{2}).(\\d{2}).(\\d{4})"
        try test(textRule: .regex(dateRegex), trueString: "21.12.2000", falseString: "21..2000")
    }
    
    private func test(textRule: TextValidationRule, trueString: String, falseString: String) throws {
        let isPassed = textRule.check(value: trueString)
        let isFailed = textRule.check(value: falseString) == false
        
        XCTAssertTrue(isPassed && isFailed)
    }
}
