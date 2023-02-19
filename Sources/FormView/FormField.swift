//
//  FormField.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public struct FormField: View {
    
    @Environment(\.focusField) var focusField
    
    private let id: String
    private var title: LocalizedStringKey
    
    @ObservedObject private var validator: Validator<String, TextValidationRule>
    
    @FocusState private var isFocused: Bool
    
    public init(
        _ title: LocalizedStringKey = "",
        text: Binding<String>,
        validationRules: [TextValidationRule] = [],
        inputRules: [TextValidationRule] = [],
        failedValidationRules: Binding<[TextValidationRule]>? = nil
    ) {
        self.id = UUID().uuidString
        self.title = title
        self.validator = Validator(
            value: text,
            validationRules: validationRules,
            inputRules: inputRules,
            failedValidationRules: failedValidationRules
        )
    }
    
    public var body: some View {
        TextField(title, text: $validator.value)
            .focused($isFocused)
            .onChange(of: validator.value) { [oldValue = validator.value] newValue in
                if validator.validateInput(newValue: newValue).isEmpty {
                    validator.value = newValue
                } else {
                    validator.value = oldValue
                }
            }
            .onChange(of: focusField) { newValue in
                isFocused = newValue.trimmingCharacters(in: .whitespaces) == id
            }
            .onAppear {
                validator.validate()
            }
            .preference(key: FieldStatesKey.self, value: [FieldState(id: id, isFocused: isFocused)])
    }
}
