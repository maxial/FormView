//
//  View+FieldIndex.swift
//  
//
//  Created by Maxim Aliev on 27.01.2023.
//

import SwiftUI

struct FieldIndex: _ViewTraitKey {
    
    static var defaultValue: Int64? = nil
}

extension View {
    
    @ViewBuilder
    public func setFieldIndex(index: Int64?) -> some View {
        if let index = index {
            _trait(FieldIndex.self, index)
        } else {
            self
        }
    }
}
