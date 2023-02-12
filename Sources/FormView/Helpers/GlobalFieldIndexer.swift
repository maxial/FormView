//
//  GlobalFieldIndexer.swift
//  
//
//  Created by Maxim Aliev on 06.02.2023.
//

import SwiftUI

struct GlobalFieldIndexer {
    
    private static var _fieldIndex: Int = -1
    private static var _editableFieldIndex: Int = .zero
    
    var fieldIndex: Double { Double(GlobalFieldIndexer._fieldIndex) }
    static var editableFieldIndex: Double { Double(GlobalFieldIndexer._editableFieldIndex) }
    
    init() {
        GlobalFieldIndexer._fieldIndex += 1
    }
    
    static func setEditableFieldIndex(_ newValue: Int) {
        _editableFieldIndex = newValue
    }
    
    static func resetFieldIndex() {
        _fieldIndex = -1
    }
}
