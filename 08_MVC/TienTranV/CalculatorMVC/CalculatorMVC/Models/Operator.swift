//
//  Operator.swift
//  CalculatorMVC
//
//  Created by TranVanTien on 11/25/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import Foundation

enum Operator: String {
    case plus = "+"
    case mutiplied = "X"
    case divide = "/"
    case subtract = "-"
    case none
}

final class OperatorManager {
    
    private static var sharedOperatorManager: OperatorManager = {
        let operatorManager = OperatorManager()
        return operatorManager
    }()
    
    class func shared() -> OperatorManager {
        return sharedOperatorManager
    }
    
    var `operator`: Operator = .none
    
    private init() {}
    
    func calculatedResultWithOperator(result: Float?, number: Float) -> Float? {
        guard let result = result else { return nil }
        switch self.operator {
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
