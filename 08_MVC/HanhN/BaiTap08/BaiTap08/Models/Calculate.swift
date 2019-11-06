//
//  Calculate.swift
//  BaiTap08
//
//  Created by ANH NGUYỄN on 10/29/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import Foundation
final class Data {
    
    enum MathOperation: Int {
        case plus
        case minus
        case mul
        case div
        case equal
        case reset
    }
    
    var result: Double = 0

    static let share = Data()
    private init() { }

    func calculateResult(operation: MathOperation, previousNumber: Double, numberOnScreen: Double) {
        switch operation {
        case. div: result = previousNumber / numberOnScreen
        case. mul: result = previousNumber * numberOnScreen
        case. plus: result = previousNumber + numberOnScreen
        case. minus: result = previousNumber - numberOnScreen
        default:
            break
        }
    }
}



