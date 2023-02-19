//
//  InspectionWrapperView.swift
//  
//
//  Created by Maxim Aliev on 18.02.2023.
//

import SwiftUI

struct InspectionWrapperView<V: View>: View {
    
    let inspection = Inspection<Self>()
    var wrapped: V
    
    init(wrapped: V) {
        self.wrapped = wrapped
    }
    
    var body: some View {
        wrapped
            .onReceive(inspection.notice) {
                inspection.visit(self, $0)
            }
    }
}
