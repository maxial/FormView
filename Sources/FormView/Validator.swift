//
//  Validator.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public enum ValidationResult<T: Hashable> {
    
    case passed
    case failed(rules: [AnyValidationRule<T>])
}

public typealias ResultCompletion<T> = (ValidationResult<T>) -> Void where T: Hashable

final class Validator<T: Hashable, V: ValidationRule>: ObservableObject where T == V.Value {
    
    @Binding private var bindValue: T
    private let rules: [V]
    private let resultCompletion: ResultCompletion<T>?
    
    @Published var value: T {
        willSet { validate(newValue: newValue) }
        didSet { bindValue = value }
    }
    
    init(
        value: Binding<T>,
        rules: [V],
        resultCompletion: ResultCompletion<T>? = nil
    ) {
        self.rules = rules
        self.resultCompletion = resultCompletion
        self._bindValue = value
        self.value = value.wrappedValue
    }
    
    func validate(newValue: T? = nil) {
        let failedRules = rules
            .filter { $0.check(value: newValue ?? value) == false }
            .map { AnyValidationRule($0) }
        resultCompletion?(failedRules.isEmpty ? .passed : .failed(rules: failedRules))
    }
}
