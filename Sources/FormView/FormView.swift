//
//  FormView.swift
//  
//
//  Created by Maxim Aliev on 27.01.2023.
//

import SwiftUI

public struct FormView<Content: View>: View {
    
    @ViewBuilder public let content: Content
    @FocusState public var focusIndex: Int64?
    
    public init(focusIndex: Int64? = nil, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.focusIndex = focusIndex
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                ExecResetFieldCounter()
                GetAccessToViews(in: content) { views in
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
    }
}
