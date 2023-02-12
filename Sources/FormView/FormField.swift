//
//  FormField.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public struct FormField: View {
    
    @Environment(\.isFocused) var isFocused
    
    private var title: LocalizedStringKey = ""
    @ObservedObject private var validator: Validator<String, TextValidationRule>
    @FocusState private var isTextFieldFocused: Bool
    
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
    }
    
    public var body: some View {
        TextField(title, text: $validator.value)
            .focused($isTextFieldFocused)
//            .preference(key: FieldFocusKey.self, value: [FormFieldContainer(view: self)])
            .onAppear {
                validator.validate()
            }
            .onChange(of: isFocused) { newValue in
                isTextFieldFocused = newValue
            }
    }
}

//struct FieldFocusKey: PreferenceKey {
//
//    static var defaultValue: [FormFieldContainer] = []
//
//    static func reduce(value: inout [FormFieldContainer], nextValue: () -> [FormFieldContainer]) {
//        value += nextValue()
//    }
//}
//
//struct FormFieldContainer: Equatable {
//
//    let id = UUID().uuidString
//    let view: FormField
//
//    static func == (lhs: FormFieldContainer, rhs: FormFieldContainer) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
