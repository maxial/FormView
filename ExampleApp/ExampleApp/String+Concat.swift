//
//  String+Concat.swift
//  Example
//
//  Created by Maxim Aliev on 07.02.2023.
//

import Foundation

extension String {
    
    static let empty = ""
    static let space = " "
    static let comma = ","
    
    static func concat(strings: [String], delimeter: String = comma + space) -> String {
        let strings = strings.filter { $0.count > 0 }
        
        var result: String = .empty
        
        for (i, string) in strings.enumerated() {
            if i == strings.count - 1 {
                result += string
            } else {
                result += string + delimeter
            }
        }
        
        return result
    }
}
