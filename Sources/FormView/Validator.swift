//
//  Validator.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public enum ValidationResult<V: ValidationRule> {
    
    case passed
    case failed(rules: [V])
}

public typealias ResultCompletion<V> = (ValidationResult<V>) -> Void where V: ValidationRule

final class Validator<T: Hashable, V: ValidationRule>: ObservableObject where T == V.Value {
    
    @Binding private var bindValue: T
    private let rules: [V]
    private let resultCompletion: ResultCompletion<V>?
    
    @Published var value: T {
        willSet { validate(newValue: newValue) }
        didSet { bindValue = value }
    }
    
    init(
        value: Binding<T>,
        rules: [V],
        resultCompletion: ResultCompletion<V>? = nil
    ) {
        self.rules = rules
        self.resultCompletion = resultCompletion
        self._bindValue = value
        self.value = value.wrappedValue
    }
    
    func validate(newValue: T? = nil) {
        let failedRules = rules.filter { $0.check(value: newValue ?? value) == false }
        resultCompletion?(failedRules.isEmpty ? .passed : .failed(rules: failedRules))
    }
}
