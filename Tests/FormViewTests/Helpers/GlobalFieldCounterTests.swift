//
//  GlobalFieldCounterTests.swift
//  
//
//  Created by Maxim Aliev on 07.02.2023.
//

import XCTest
@testable import FormView

import SwiftUI

final class GlobalFieldCounterTests: XCTestCase {
    
    @State var text1 = ""
    @State var text2 = ""
    
    func testCounter() throws {
        _ = ExecResetGlobalFieldCounter()
        
        let fstIndex = GlobalFieldCounter().value
        let sndIndex = GlobalFieldCounter().value
        _ = ExecResetGlobalFieldCounter()
        let indexAfterReset = GlobalFieldCounter().value
        
        XCTAssertEqual(fstIndex, 0)
        XCTAssertEqual(sndIndex, 1)
        XCTAssertEqual(fstIndex, indexAfterReset)
    }
    
    func testCounterByFormFields() throws {
        _ = ExecResetGlobalFieldCounter()
        
        _ = FormField("Field 1", text: $text1)
        _ = FormField("Field 2", text: $text2)
        
        let currentFieldIndex = GlobalFieldCounter().value
        
        XCTAssertEqual(currentFieldIndex, 2)
    }
}
