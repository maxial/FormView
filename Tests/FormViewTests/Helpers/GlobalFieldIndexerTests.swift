//
//  GlobalFieldIndexerTests.swift
//  
//
//  Created by Maxim Aliev on 07.02.2023.
//

import XCTest
@testable import FormView

import SwiftUI

final class GlobalFieldIndexerTests: XCTestCase {
    
    @State var text1 = ""
    @State var text2 = ""
    
    func testFieldIndex() throws {
        GlobalFieldIndexer.resetFieldIndex()
        let fstIndex = GlobalFieldIndexer().fieldIndex
        let sndIndex = GlobalFieldIndexer().fieldIndex
        GlobalFieldIndexer.resetFieldIndex()
        let indexAfterReset = GlobalFieldIndexer().fieldIndex
        
        XCTAssertEqual(fstIndex, 0)
        XCTAssertEqual(sndIndex, 1)
        XCTAssertEqual(fstIndex, indexAfterReset)
    }
    
    func testEditableFieldIndex() throws {
        let editableFieldIndex = 5
        
        GlobalFieldIndexer.setEditableFieldIndex(editableFieldIndex)
        
        XCTAssertEqual(GlobalFieldIndexer.editableFieldIndex, editableFieldIndex)
    }
    
    func testFieldIndexByFormFields() throws {
        GlobalFieldIndexer.resetFieldIndex()
        _ = FormField("Field 1", text: $text1)
        _ = FormField("Field 2", text: $text2)
        let currentFieldIndex = GlobalFieldIndexer().fieldIndex
        
        XCTAssertEqual(currentFieldIndex, 2)
    }
}
