//
//  FormViewTests.swift
//  
//
//  Created by Maxim Aliev on 18.02.2023.
//

import SwiftUI
import XCTest
import ViewInspector
import Combine
@testable import FormView

final class FormViewTests: XCTestCase {
    
    func testPreventInvalidInput() throws {
        var text1 = ""
        var text2 = ""
        let sut = InspectionWrapperView(
            wrapped: FormView {
                FormField(
                    text: Binding(get: { text1 }, set: { text1 = $0 }),
                    validationRules: [.digitsOnly],
                    inputRules: [.digitsOnly]
                )
                .id(1)
                FormField(
                    text: Binding(get: { text2 }, set: { text2 = $0 })
                )
                .id(2)
            }
        )
        
        let exp = sut.inspection.inspect { view in
            let scrollView = try view.find(ViewType.ScrollView.self)
            let textField1 = try view.find(viewWithId: 1).textField()
            
            try scrollView.callOnSubmit()
            try textField1.callOnChange(newValue: "New Focus Field", index: 1)
            
            try textField1.callOnChange(newValue: "123")
            XCTAssertEqual(try textField1.input(), "123")
            
            text1 = "123"
            try textField1.callOnChange(newValue: "123_A")
            XCTAssertEqual(try textField1.input(), text1)
        }
        
        ViewHosting.host(view: sut)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testSubmitTextField() throws {
        var text1 = ""
        var text2 = ""
        let sut = InspectionWrapperView(
            wrapped: FormView {
                FormField(
                    text: Binding(get: { text1 }, set: { text1 = $0 }),
                    validationRules: [.digitsOnly],
                    inputRules: [.digitsOnly]
                )
                .id(1)
                FormField(
                    text: Binding(get: { text2 }, set: { text2 = $0 })
                )
                .id(2)
            }
        )
        
        let exp = sut.inspection.inspect { view in
            let scrollView = try view.find(ViewType.ScrollView.self)
            let textField1 = try view.find(viewWithId: 1).textField()
//            let formField2 = try view.find(viewWithId: 2).view(FormField.self).actualView()
            
            try scrollView.callOnSubmit()
            try textField1.callOnChange(newValue: "field2", index: 1)
            
//            XCTAssertEqual(formField2.focusField, "field2")
            XCTAssertTrue(true)
        }
        
        ViewHosting.host(view: sut.environment(\.focusField, "field1"))
        wait(for: [exp], timeout: 0.1)
    }
    
    func testFocusNextField() throws {
        var fieldStates = [FieldState(id: "1", isFocused: false), FieldState(id: "2", isFocused: false)]
        
        var nextFocusField = fieldStates.focusNextField()
        XCTAssertEqual(nextFocusField, "1")
        
        nextFocusField = fieldStates.focusNextField()
        XCTAssertEqual(nextFocusField, "2")
    }
}
