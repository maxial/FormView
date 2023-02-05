//
//  FieldCounter.swift
//  
//
//  Created by Maxim Aliev on 06.02.2023.
//

import SwiftUI

struct FieldCounter {
    
    static var _value: Int64 = .zero
    
    var value: Int64 { FieldCounter._value }
    
    init() {
        FieldCounter._value += 1
    }
    
    static func reset() {
        _value = .zero
    }
}

struct ExecResetFieldCounter: View {
    
    init() {
        FieldCounter.reset()
    }
    
    var body: some View {
        EmptyView()
    }
}
