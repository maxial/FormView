//
//  View+FocusNext.swift
//  
//
//  Created by Maxim Aliev on 27.01.2023.
//

import SwiftUI

extension View {
    
    func focusNext(_ next: FocusState<Int64?>.Binding) {
        guard let currentValue = next.wrappedValue else { return }
        let nextValue = currentValue + 1
        next.wrappedValue = nextValue
    }
}
