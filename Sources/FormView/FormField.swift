//
//  FormField.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public struct FormField: View {
    
    @Environment(\.focusFieldIndex) var focusFieldIndex
    
    private var title: LocalizedStringKey = ""
    @ObservedObject private var validator: Validator<String, TextValidationRule>
    private let fieldIndex: Int
    
    @FocusState private var isFocused: Bool
    
    private var failedRules: [TextValidationRule] { validator.failedRules }
    
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
        self.fieldIndex = Int(round(GlobalFieldIndexer().fieldIndex))
    }
    
    public var body: some View {
        TextField(title, text: $validator.value, onEditingChanged: { changed in
            if changed {
                GlobalFieldIndexer.setEditableFieldIndex(fieldIndex)
            }
        })
        .focused($isFocused)
        .onChange(of: focusFieldIndex) { newValue in
            isFocused = Int(round(newValue)) == fieldIndex
        }
        .onAppear {
            validator.validate()
        }
    }
}
