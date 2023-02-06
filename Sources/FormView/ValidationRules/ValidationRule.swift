//
//  ValidationRule.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import Foundation

public protocol ValidationRule {
    associatedtype Value: Hashable
    
    var errorMessage: String { get }
    
    func check(value: Value) -> Bool
}

public struct AnyValidationRule<T: Hashable>: ValidationRule {
    
    private let _errorMessage: String
    private let _check: (T) -> Bool
    
    public var errorMessage: String { _errorMessage }
    
    init<V: ValidationRule>(_ validationRule: V) where V.Value == T {
        self._errorMessage = validationRule.errorMessage
        self._check = validationRule.check
    }
    
    public func check(value: T) -> Bool {
        return _check(value)
    }
}
