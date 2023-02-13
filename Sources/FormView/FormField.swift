//
//  FormField.swift
//  
//
//  Created by Maxim Aliev on 29.01.2023.
//

import SwiftUI

public struct FormField: View {
    
    @Environment(\.focusFieldIndex) var focusFieldIndex
    
    private var placeholder: LocalizedStringKey = ""
    @ObservedObject private var validator: Validator<String, TextValidationRule>
    private let fieldIndex: Int
    
    @FocusState private var isFocused: Bool
    
    public init<T>(
        id: T,
        placeholder: LocalizedStringKey = "",
        text: Binding<String>,
        rules: [TextValidationRule] = [],
        failedRules: Binding<[TextValidationRule]>? = nil
    ) where T: Hashable {
        if GlobalFieldIndexer.getIndexForField(id: id) == nil {
            GlobalFieldIndexer.setIndexForField(id: id)
        }
        self.fieldIndex = GlobalFieldIndexer.getIndexForField(id: id) ?? .zero
        self.placeholder = placeholder
        self.validator = Validator(value: text, rules: rules, failedRules: failedRules)
//        self.fieldIndex = Int(round(GlobalFieldIndexer().fieldIndex))
//        print(self.fieldIndex)
    }
    
    public var body: some View {
        TextField(placeholder, text: $validator.value, onEditingChanged: { changed in
            if changed {
                GlobalFieldIndexer.setEditableFieldIndex(fieldIndex)
                print("Changed TRUE", focusFieldIndex)
            }
        })
        .focused($isFocused)
        .onChange(of: focusFieldIndex) { newValue in
            isFocused = Int(round(newValue)) == fieldIndex
//            print("OnChange FieldIndex", fieldIndex)
//            print("OnChange NewFocus", newValue)
        }
        .onAppear {
            validator.validate()
        }
    }
}
