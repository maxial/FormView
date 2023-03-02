//
//  FormViewModifier.swift
//  
//
//  Created by Maxim Aliev on 01.03.2023.
//

import SwiftUI

public struct FormViewModifier: ViewModifier {
    
    @State private var fieldStates: [FieldState] = []
    @State private var focusField: String = ""
    
    public func body(content: Content) -> some View {
        content
            .onPreferenceChange(FieldStatesKey.self) { newValue in
                fieldStates = newValue
            }
            .onSubmit(of: .text) {
                focusField = fieldStates.focusNextField(currentFocusField: focusField)
            }
            .environment(\.focusField, focusField)
    }
}

extension View {
    
    public func formView() -> some View {
        modifier(FormViewModifier())
    }
}
