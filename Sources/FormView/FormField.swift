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
        rules: [TextValidationRule] = [],
        failedRules: Binding<[TextValidationRule]>? = nil
    ) {
        self.id = UUID().uuidString
        self.title = title
        self.validator = Validator(value: text, rules: rules, failedRules: failedRules)
    }
    
    public var body: some View {
        TextField(title, text: $validator.value)
            .focused($isFocused)
            .onChange(of: focusField) { newValue in
                isFocused = newValue == id
            }
            .onAppear {
                validator.validate()
            }
            .preference(key: FieldStatesKey.self, value: [FieldState(id: id, isFocused: isFocused)])
    }
}
