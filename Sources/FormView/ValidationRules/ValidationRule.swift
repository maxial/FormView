//
//  ValidationRule.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import Foundation

public protocol ValidationRule {
    associatedtype Value: Hashable
    
    func check(value: Value) -> Bool
}

public struct AnyValidationRule<T: Hashable>: ValidationRule {
    
    private let _check: (T) -> Bool
    
    init<V: ValidationRule>(_ validationRule: V) where V.Value == T {
        self._check = validationRule.check
    }
    
    public func check(value: T) -> Bool {
        return _check(value)
    }
}
