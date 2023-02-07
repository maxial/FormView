//
//  FormFieldModifier.swift
//  Example
//
//  Created by Maxim Aliev on 08.02.2023.
//

import SwiftUI

struct FormFieldModifier: ViewModifier {
    
    var errorMessage: String
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .border(errorMessage.isEmpty ? .clear : .red)
            .padding()
        if errorMessage.isEmpty == false {
            Text(errorMessage)
                .font(.system(size: 9))
                .foregroundColor(.red)
        }
    }
}
