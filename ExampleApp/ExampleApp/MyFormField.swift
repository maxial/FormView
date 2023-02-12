//
//  MyFormField.swift
//  Example
//
//  Created by Maxim Aliev on 12.02.2023.
//

import SwiftUI

struct MyFormField: View {
    
    
    
    var body: some View {
        VStack {
            content
                .font(.system(size: 14))
                .frame(height: 40)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(errorMessage.isEmpty ? Color.secondary : .red, lineWidth: 1)
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 4)
            if errorMessage.isEmpty == false {
                Text(errorMessage)
                    .font(.system(size: 9))
                    .frame(height: 20)
                    .foregroundColor(.red)
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 4)
            } else {
                Color.clear
                    .frame(height: 24)
            }
        }
    }
}
