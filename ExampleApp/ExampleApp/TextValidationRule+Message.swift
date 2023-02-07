//
//  TextValidationRule+Message.swift
//  Example
//
//  Created by Maxim Aliev on 07.02.2023.
//

import FormView

extension TextValidationRule {
    
    var message: String {
        switch self {
        case .notEmpty:
            return "Not empty"
        case .minLength(let int):
            return "Min length \(int)"
        case .maxLength(let int):
            return "Max length \(int)"
        case .atLeastOneDigit:
            return "At least one digit"
        case .atLeastOneLetter:
            return "At least one letter"
        case .digitsOnly:
            return "Digits only"
        case .lettersOnly:
            return "Letters only"
        case .atLeastOneLowercaseLetter:
            return "At least one lowercase letter"
        case .atLeastOneUppercaseLetter:
            return "At least one uppercase letter"
        case .atLeastOneSpecialCharacter:
            return "At least one special character"
        case .noSpecialCharacters:
            return "No special characters"
        case .email:
            return "Email"
        case .notRecurringPincode:
            return "Not recurring pincode"
        case .regex(let string):
            return "Regex: \(string)"
        }
    }
}
