//
//  GlobalFieldCounter.swift
//  
//
//  Created by Maxim Aliev on 06.02.2023.
//

import SwiftUI

struct GlobalFieldCounter {
    
    static var _value: Int64 = -1
    
    var value: Int64 { GlobalFieldCounter._value }
    
    init() {
        GlobalFieldCounter._value += 1
        print(value)
    }
    
    static func reset() {
        _value = -1
    }
}

struct ExecResetGlobalFieldCounter: View {
    
    init() {
        GlobalFieldCounter.reset()
    }
    
    var body: some View {
        EmptyView()
    }
}
