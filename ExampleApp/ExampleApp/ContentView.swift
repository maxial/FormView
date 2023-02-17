//
//  ContentView.swift
//  Example
//
//  Created by Maxim Aliev on 28.01.2023.
//

import SwiftUI
import FormView

enum FieldType: Int {
    
    case companyName
    case fstEmployeeName
    case fstEmployeeAge
    case fstEmployeeEmail
    case sndEmployeeName
    case sndEmployeeAge
    case sndEmployeeEmail
    case companyPhone
}

struct ContentView: View {
    
    @State var companyName: String = ""
    
    @State var fstEmployeeName: String = ""
    @State var fstEmployeeAge: String = ""
    @State var fstEmployeeEmail: String = ""
    @State var sndEmployeeName: String = ""
    @State var sndEmployeeAge: String = ""
    @State var sndEmployeeEmail: String = ""
    
    @State var companyPhone: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 245/255.0, green: 246/255.0, blue: 250/255.0)
                .ignoresSafeArea()
            FormView(alignment: .leading) {
                MyFormField(
                    "Company",
                    text: $companyName,
                    validationRules: [.noSpecialCharacters],
                    inputRules: [.noSpecialCharacters]
                )
                
                HStack {
                    MyFormField(
                        "Name",
                        text: $fstEmployeeName,
                        validationRules: [.noSpecialCharacters],
                        inputRules: [.noSpecialCharacters]
                    )
                    .frame(width: 100)
                    MyFormField(
                        "Age",
                        text: $fstEmployeeAge,
                        validationRules: [.digitsOnly, .maxLength(2)],
                        inputRules: [.digitsOnly, .maxLength(2)]
                    )
                    .frame(width: 60)
                    MyFormField(
                        "Email",
                        text: $fstEmployeeEmail,
                        validationRules: [.email]
                    )
                }
                
                HStack {
                    MyFormField(
                        "Name",
                        text: $sndEmployeeName,
                        validationRules: [.noSpecialCharacters],
                        inputRules: [.noSpecialCharacters]
                    )
                    .frame(width: 100)
                    MyFormField(
                        "Age",
                        text: $sndEmployeeAge,
                        validationRules: [.digitsOnly, .maxLength(2)],
                        inputRules: [.digitsOnly, .maxLength(2)]
                    )
                    .frame(width: 60)
                    MyFormField(
                        "Email",
                        text: $sndEmployeeEmail,
                        validationRules: [.email]
                    )
                }
                
                HStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                        .font(.system(size: 12))
                    Spacer()
                }
                .padding(.horizontal, 4)
                .padding(.bottom, 20)
                
                MyFormField(
                    "Company phone",
                    text: $companyPhone,
                    validationRules: [.minLength(11), .maxLength(11), .digitsOnly],
                    inputRules: [.maxLength(11), .digitsOnly]
                )
            }
            .padding(.horizontal, 12)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
