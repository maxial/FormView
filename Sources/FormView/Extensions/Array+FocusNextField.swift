//
//  Array+FocusNextField.swift
//  
//
//  Created by Maxim Aliev on 19.02.2023.
//

import Foundation

extension Array where Element == FieldState {
    
    mutating func focusNextField() -> String {
        let currentFocusField = first { $0.isFocused }?.id ?? ""
        
        let nextIndex = (firstIndex { $0.isFocused } ?? -1) + 1
        for i in 0..<count {
            self[i].isFocused = i == nextIndex
        }
        let nextFocusField = count > 0 ? self[nextIndex].id : ""
        
        return nextFocusField == currentFocusField ? nextFocusField + " " : nextFocusField
    }
}
