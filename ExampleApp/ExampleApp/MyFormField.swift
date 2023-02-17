//
//  MyFormField.swift
//  Example
//
//  Created by Maxim Aliev on 12.02.2023.
//

import SwiftUI
import FormView

struct MyFormField: View {
    
    private let title: LocalizedStringKey
    private let text: Binding<String>
    private let validationRules: [TextValidationRule]
    private let inputRules: [TextValidationRule]
    
    @State private var failedValidationRules: [TextValidationRule] = []
    
    init(
        _ title: LocalizedStringKey = "",
        text: Binding<String>,
        validationRules: [TextValidationRule] = [],
        inputRules: [TextValidationRule] = []
    ) {
        self.title = title
        self.text = text
        self.validationRules = validationRules
        self.inputRules = inputRules
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Color.white
                    .cornerRadius(12)
                    .shadow(
                        color: Color(red: 216/255.0, green: 220/255.0, blue: 232/255.0),
                        radius: 3,
                        x: .zero,
                        y: 3
                    )
                ZStack {
                    FormField(
                        title,
                        text: text,
                        validationRules: validationRules,
                        inputRules: inputRules,
                        failedValidationRules: $failedValidationRules
                    )
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .tint(Color.black)
                    .frame(height: 40)
                    .padding(.horizontal, 12)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(failedValidationRules.isEmpty ? Color.clear : .red, lineWidth: 1)
                }
            }
            .frame(height: 40)
            
            if failedValidationRules.isEmpty == false {
                Text(String.concat(strings: failedValidationRules.map { $0.message }))
                    .lineLimit(2)
                    .font(.system(size: 9, weight: .semibold))
                    .foregroundColor(.red)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 4)
        .frame(height: 72)
    }
}
