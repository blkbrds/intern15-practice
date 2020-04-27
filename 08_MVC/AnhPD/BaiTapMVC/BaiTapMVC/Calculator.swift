//
//  Calculator.swift
//  BaiTapMVC
//
//  Created by PCI0012 on 4/23/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import Foundation

class Calculator {
    static let share = Calculator()
    var test: String = ""
    var operands: [String] = []
    var result: Float = 0
    
    func add(value: Float) -> Float {
        return result + value
    }
    
    func calculation(value: Float) -> Float {
        switch test {
        case "+":
            return result + value
        case "-":
            return result - value
        case "x":
            return result * value
        case "/":
            if value == 0 {
                return 0
            } else {
                return result / value
            }
        default:
            return 0
        }
    }
}
