//
//  Operator.swift
//  MVC
//
//  Created by PhuocNguyen on 10/14/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import Foundation

final class OperatorManager  {
    
    static let caculate: OperatorManager = OperatorManager()
    var operate: Operators = .none
    
    private init() {}
    
    func caculated(result: Float?, number: Float) -> Float? {
        guard let result = result else { return nil }
        switch operate {
        case .divide:
            return number == 0 ? nil : result / number
        case .mutiplied:
            return result * number
        case .plus:
            return result + number
        case .subtract:
            return result - number
        case .none:
            return number
        }
    }
}
