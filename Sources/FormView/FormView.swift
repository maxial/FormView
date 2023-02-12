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
    @FocusState private var focusIndex: Int64?
    
    public init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat = .zero,
        showsIndicators: Bool = false,
        focusIndex: Int64? = .zero,
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
            ExecResetGlobalFieldCounter()
            GetAccessToViews(in: content) { views in
                makeVStackView(views: views)
            }
        }
//        .onPreferenceChange(FieldFocusKey.self) { newValue in
//            indexeses = newValue.compactMap { $0.view.index }
//            newValue.forEach { container in
//
//                container.view
//                    .focused($focusIndex, equals: container.view.index)
//                    .setFieldIndex(index: container.view.index)
//                    .onSubmit {
//                        focusNext($focusIndex)
//                    }
////                if let fieldIndex = $0.view[FieldIndex.self] {
////                    print(fieldIndex)
////                }
//            }
//            print(newValue)
//        }
    }
    
    private func makeVStackView(views: _VariadicView.Children) -> some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(views) { view in
                view
                    .focused($focusIndex, equals: GlobalFieldCounter().value)
                    .onSubmit {
                        focusNext($focusIndex)
                    }
//                if let fieldIndex = view[FieldIndex.self] {
//                    view
//                        .focused($focusIndex, equals: fieldIndex)
//                        .onSubmit {
//                            focusNext($focusIndex)
//                        }
//                } else {
//                    view
//                }
            }
        }
    }
}
