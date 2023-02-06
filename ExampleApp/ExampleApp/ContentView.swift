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
    @State var address: String = ""
    
    var body: some View {
        FormView(alignment: .leading) {
            FormField("Name", text: $name, rules: [.lettersOnly]) { failedRules in
                print(failedRules)
            }
            Text("text")
            FormField("Surname", text: $surname, rules: [.lettersOnly]) { failedRules in
//                print(failedRules)
            }
            Text("text")
            FormField("Address", text: $address, rules: [.digitsOnly]) { failedRules in
//                print(failedRules)
            }
            Text("text")
        }
    }
}

extension TextValidationRule {
    
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
