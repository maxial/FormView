//
//  TextValidationRule.swift
//  
//
//  Created by Maxim Aliev on 27.01.2023.
//

import Foundation

public enum TextValidationRule: ValidationRule {
    
    private enum Constants {
        
        static let predicateFormat = "SELF MATCHES %@"
        static let specialCharactersRegex = ".*[^A-Za-z0-9 ].*"
        static let recurringPincodeRegex = "([0-9])\\1\\1\\1"
        static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    }
    
    case notEmpty
    case minLength(Int)
    case maxLength(Int)
    case atLeastOneDigit
    case atLeastOneLetter
    case digitsOnly
    case lettersOnly
    case atLeastOneLowercaseLetter
    case atLeastOneUppercaseLetter
    case atLeastOneSpecialCharacter
    case noSpecialCharacters
    case email
    case notRecurringPincode
    case regex(String)
    
    public func check(value: String) -> Bool {
        switch self {
        case .notEmpty:
            return checkNotEmpty(value)
        case .minLength(let count):
            return checkMinLength(value, count: count)
        case .maxLength(let count):
            return checkMaxLength(value, count: count)
        case .atLeastOneDigit:
            return checkAtLeastOneDigit(value)
        case .atLeastOneLetter:
            return checkAtLeastOneLetter(value)
        case .digitsOnly:
            return checkDigitsOnly(value)
        case .lettersOnly:
            return checkLettersOnly(value)
        case .atLeastOneLowercaseLetter:
            return checkAtLeastOneLowercaseLetter(value)
        case .atLeastOneUppercaseLetter:
            return checkAtLeastOneUppercaseLetter(value)
        case .atLeastOneSpecialCharacter:
            return checkAtLeastOneSpecialCharacter(value)
        case .noSpecialCharacters:
            return checkNoSpecialCharacters(value)
        case .email:
            return checkEmail(value)
        case .notRecurringPincode:
            return checkNotRecurringPincode(value)
        case .regex(let regex):
            return checkRegex(value, regex: regex)
        }
    }
    
    private func checkNotEmpty(_ value: String) -> Bool {
        return value.isEmpty == false
    }
    
    private func checkMinLength(_ value: String, count: Int) -> Bool {
        return value.count >= count
    }
    
    private func checkMaxLength(_ value: String, count: Int) -> Bool {
        return value.count <= count
    }
    
    private func checkAtLeastOneLowercaseLetter(_ value: String) -> Bool {
        return value.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil
    }
    
    private func checkAtLeastOneUppercaseLetter(_ value: String) -> Bool {
        return value.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
    }
    
    private func checkAtLeastOneDigit(_ value: String) -> Bool {
        return value.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
    }
    
    private func checkAtLeastOneLetter(_ value: String) -> Bool {
        return value.rangeOfCharacter(from: CharacterSet.letters) != nil
    }
    
    private func checkDigitsOnly(_ value: String) -> Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: value))
    }
    
    private func checkLettersOnly(_ value: String) -> Bool {
        return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: value))
    }
    
    private func checkAtLeastOneSpecialCharacter(_ value: String) -> Bool {
        return value.range(of: Constants.specialCharactersRegex, options: .regularExpression) != nil
    }
    
    private func checkNoSpecialCharacters(_ value: String) -> Bool {
        return value.range(of: Constants.specialCharactersRegex, options: .regularExpression) == nil
    }
    
    private func checkEmail(_ value: String) -> Bool {
        let emailPredicate = NSPredicate(format: Constants.predicateFormat, Constants.emailRegex)
        return emailPredicate.evaluate(with: value)
    }
    
    private func checkNotRecurringPincode(_ value: String) -> Bool {
        return value.range(of: Constants.recurringPincodeRegex, options: .regularExpression) == nil
    }
    
    private func checkRegex(_ value: String, regex: String) -> Bool {
        let predicate = NSPredicate(format: Constants.predicateFormat, regex)
        return predicate.evaluate(with: value)
    }
}
