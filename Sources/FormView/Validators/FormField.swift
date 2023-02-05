//
//  FormField.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public struct FormField: View {
    
    private var title: String = ""
    @ObservedObject private var validator: Validator<String, TextValidationRule>
    
    private var index: Int64? = nil
    
    public init(
        _ title: String = "",
        text: Binding<String>,
        rules: [TextValidationRule] = [],
        resultCompletion: ResultCompletion<String>? = nil
    ) {
        self.title = title
        self.validator = Validator(value: text, rules: rules, resultCompletion: resultCompletion)
        self.index = FieldCounter().value
    }
    
    public var body: some View {
        TextField(title, text: $validator.value)
            .setFieldIndex(index: index)
            .onAppear {
                validator.validate()
            }
    }
}
