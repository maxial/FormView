//
//  Array+FocusNextField.swift
//  
//
//  Created by Maxim Aliev on 19.02.2023.
//

import Foundation

extension Array where Element == FieldState {
    
    mutating func focusNextField(currentFocusField: String) -> String {
        let nextIndex = (firstIndex { $0.isFocused } ?? -1) + 1
        
        for i in 0..<count {
            self[i].isFocused = i == nextIndex
        }
        let nextFocusField = nextIndex < count ? self[nextIndex].id : ""
        
        return nextFocusField == currentFocusField ? nextFocusField + " " : nextFocusField
    }
}
