//
//  FieldStates.swift
//  
//
//  Created by Maxim Aliev on 15.02.2023.
//

import SwiftUI

struct FieldState: Equatable {
    
    var id: String
    var isFocused: Bool
}

struct FieldStatesKey: PreferenceKey {
    
    static var defaultValue: [FieldState] = []
    
    static func reduce(value: inout [FieldState], nextValue: () -> [FieldState]) {
        value += nextValue()
    }
}
