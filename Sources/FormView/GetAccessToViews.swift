//
//  GetAccessToViews.swift
//  
//
//  Created by Maxim Aliev on 27.01.2023.
//

import SwiftUI

struct GetAccessToViews<Content: View, ViewsContent: View>: View {
    
    let content: () -> Content
    let views: (_VariadicView.Children) -> ViewsContent
    
    init(
        in content: Content,
        @ViewBuilder views: @escaping (_VariadicView.Children) -> ViewsContent
    ) {
        self.content = { content }
        self.views = views
    }
    
    var body: some View {
        _VariadicView.Tree(UnaryViewRoot(views: views), content: content)
    }
}

private struct UnaryViewRoot<Content: View>: _VariadicView_UnaryViewRoot {
    
    let views: (_VariadicView.Children) -> Content
    
    func body(children: _VariadicView.Children) -> some View {
        views(children)
    }
}
