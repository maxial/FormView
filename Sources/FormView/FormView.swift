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
    @ViewBuilder public let content: Content
    @FocusState public var focusIndex: Int64?
    
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat = .zero,
        showsIndicators: Bool = false,
        focusIndex: Int64? = 0,
        @ViewBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.content = content()
        self.focusIndex = focusIndex
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            ExecResetFieldCounter()
            GetAccessToViews(in: content) { views in
                makeVStackView(views: views)
            }
        }
    }
    
    private func makeVStackView(views: _VariadicView.Children) -> some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(views) { view in
                if let fieldIndex = view[FieldIndex.self] {
                    view
                        .focused($focusIndex, equals: fieldIndex)
                        .onSubmit {
                            focusNext($focusIndex)
                        }
                } else {
                    view
                }
            }
        }
    }
}
