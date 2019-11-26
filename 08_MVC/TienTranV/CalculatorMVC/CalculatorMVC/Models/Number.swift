//
//  Number.swift
//  CalculatorMVC
//
//  Created by TranVanTien on 11/25/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

final class Number {
    var number: Float = 0
    var result: Float? = 0

    func convertToNumber(with number: Int) {
        guard number < 10000000 else { return }
        
        self.number = self.number * 10 + Float(number)
    }
}
