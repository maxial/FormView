//
//  FocusField.swift
//  
//
//  Created by Maxim Aliev on 12.02.2023.
//

import SwiftUI

struct FocusFieldKey: EnvironmentKey {
    
    static var defaultValue: String = ""
}

extension EnvironmentValues {
    
    var focusField: String {
        get { self[FocusFieldKey.self] }
        set { self[FocusFieldKey.self] = newValue }
    }
}
