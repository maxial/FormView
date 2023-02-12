//
//  FocusFieldIndex.swift
//  
//
//  Created by Maxim Aliev on 12.02.2023.
//

import SwiftUI

struct FocusFieldIndexKey: EnvironmentKey {
    
    static var defaultValue: Double = .zero
}

extension EnvironmentValues {
    
    var focusFieldIndex: Double {
        get { self[FocusFieldIndexKey.self] }
        set { self[FocusFieldIndexKey.self] = newValue }
    }
}
