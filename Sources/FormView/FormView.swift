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
    
    @State private var focusFieldIndex: Double = .zero
    
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
            SwiftUIExecutor {
                GlobalFieldIndexer.resetFieldIndex()
            }
            content
        }
        .onSubmit {
            var newFocusFieldIndex = GlobalFieldIndexer.editableFieldIndex + 1
            if newFocusFieldIndex == focusFieldIndex {
                newFocusFieldIndex -= 0.01
            }
            focusFieldIndex = newFocusFieldIndex
        }
        .environment(\.focusFieldIndex, focusFieldIndex)
    }
}
