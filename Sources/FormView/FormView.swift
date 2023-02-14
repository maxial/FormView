//
//  FormView.swift
//  
//
//  Created by Maxim Aliev on 27.01.2023.
//

import SwiftUI

public struct FormView<Content: View>: View {
    
    private let alignment: HorizontalAlignment
    private let spacing: CGFloat
    private let showsIndicators: Bool
    @ViewBuilder private let content: Content
    
    @State private var fieldStates: [FieldState] = []
    @State private var focusField: String = ""
    
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat = .zero,
        showsIndicators: Bool = false,
        @ViewBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.content = content()
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            content
        }
        .onPreferenceChange(FieldStatesKey.self) { newValue in
            fieldStates = newValue
        }
        .onSubmit {
            focusNextField()
        }
        .environment(\.focusField, focusField)
    }
    
    private func focusNextField() {
        let nextIndex = (fieldStates.firstIndex { $0.isFocused } ?? -1) + 1
        for i in 0..<fieldStates.count {
            fieldStates[i].isFocused = i == nextIndex
        }
        focusField = fieldStates.first { $0.isFocused }?.id ?? ""
    }
}
