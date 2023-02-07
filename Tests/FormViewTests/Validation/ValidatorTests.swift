//
//  ValidatorTests.swift
//  
//
//  Created by Maxim Aliev on 07.02.2023.
//

import XCTest
@testable import FormView

import SwiftUI

final class ValidatorTests: XCTestCase {
    
    @State var value: String = "555555"
    
    func testValidator() throws {
        var failedRules: [TextValidationRule] = []
        var isPassed = false
        
        let exp = expectation(description: "Validator")
        
        let validator: Validator<String, TextValidationRule> = Validator(
            value: $value,
            rules: [
                .digitsOnly,
                .minLength(3),
                .maxLength(5),
                .notRecurringPincode
            ]
        ) { validationResult in
            switch validationResult {
            case .passed:
                isPassed = true
                exp.fulfill()
            case let .failed(rules):
                failedRules = rules
            }
        }
        
        validator.validate()
        validator.validate(newValue: "1234")
        
        waitForExpectations(timeout: 1)
        
        XCTAssertEqual(failedRules, [.maxLength(5), .notRecurringPincode])
        XCTAssertTrue(isPassed)
    }
}
