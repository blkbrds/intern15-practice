//
//  Number.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class Number {
    var number: Float = 0
    var result: Float? = 0
    
    func convertToNumber(with number: Int) {
        guard number < 1000000 else { return }
        self.number = self.number * 10 + Float(number)
    }
}
