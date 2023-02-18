//
//  File.swift
//  
//
//  Created by Maxim Aliev on 18.02.2023.
//

import Combine
import ViewInspector

final class Inspection<V> {
    
    let notice = PassthroughSubject<UInt, Never>()
    var callbacks: [UInt: (V) -> Void] = [:]
    func visit(_ view: V, _ line: UInt) {
        if let callback = callbacks.removeValue(forKey: line) {
            callback(view)
        }
    }
}

extension Inspection: InspectionEmissary { }
