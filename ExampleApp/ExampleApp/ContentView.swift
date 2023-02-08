//
//  ContentView.swift
//  Example
//
//  Created by Maxim Aliev on 28.01.2023.
//

import SwiftUI
import FormView

struct ContentView: View {
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var nameFieldErrorMessage: String = ""
    @State var surnameFieldErrorMessage: String = ""
    
    var body: some View {
        FormView(alignment: .leading) {
            FormField(
                "Name",
                text: $name,
                rules: [.minLength(3)],
                failedRules: {
                    nameFieldErrorMessage = String.concat(
                        strings: $0.map { $0.message }
                    )
                }
            )
            .modifier(FormFieldModifier(errorMessage: nameFieldErrorMessage))
            
            FormField(
                "Surname",
                text: $surname,
                rules: [.maxLength(4)],
                failedRules: {
                    surnameFieldErrorMessage = String.concat(
                        strings: $0.map { $0.message }
                    )
                }
            )
            .modifier(FormFieldModifier(errorMessage: surnameFieldErrorMessage))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
