//
//  SwiftUIExecutor.swift
//  
//
//  Created by Maxim Aliev on 12.02.2023.
//

import SwiftUI

struct SwiftUIExecutor: View {
    
    init(exec: () -> Void) {
        exec()
    }
    
    var body: some View {
        EmptyView()
    }
}
