//
//  ValidatorTests.swift
//  
//
//  Created by Maxim Aliev on 19.02.2023.
//

import SwiftUI
import XCTest
@testable import FormView

final class ValidatorTests: XCTestCase {
    
    func testValidator() throws {
        var text: String = ""
        var failedValidationRules: [TextValidationRule] = []
        
        let validator = Validator<String, TextValidationRule>(
            value: Binding(get: { text }, set: { text = $0 }),
            validationRules: [.digitsOnly],
            inputRules: [.maxLength(4)],
            failedValidationRules: Binding(get: { failedValidationRules }, set: { failedValidationRules = $0 })
        )
        
        validator.value = "1"
        validator.validate()
        XCTAssertTrue(failedValidationRules.isEmpty)
        
        validator.value = "12_A"
        XCTAssertEqual(failedValidationRules, [.digitsOnly])
        
        validator.value = "12345"
        let failedInputRules = validator.checkInput()
        XCTAssertEqual(failedInputRules, [.maxLength(4)])
    }
}
