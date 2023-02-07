//
//  FormField.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public struct FormField: View {
    
    private var title: LocalizedStringKey = ""
    @ObservedObject private var validator: Validator<String, TextValidationRule>
    private var index: Int64? = nil
    
    public var failedRules: [TextValidationRule] { validator.failedRules }
    
    public init(
        _ title: LocalizedStringKey = "",
        text: Binding<String>,
        rules: [TextValidationRule] = [],
        failedRules: (([TextValidationRule]) -> Void)? = nil
    ) {
        self.title = title
        self.validator = Validator(value: text, rules: rules) { result in
            switch result {
            case .passed:
                failedRules?([])
            case let .failed(rules):
                failedRules?(rules)
            }
        }
        self.index = GlobalFieldCounter().value
    }
    
    public var body: some View {
        TextField(title, text: $validator.value)
            .setFieldIndex(index: index)
            .onAppear {
                validator.validate()
            }
    }
}
