//
//  Calculate.swift
//  BaiTapMVC
//
//  Created by PCI0018 on 10/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import Foundation

enum Operators: String {
    case plus = "+"
    case mutiplied = "x"
    case divide = "/"
    case subtract = "-"
    case none
}

final class Calculate {

    static let share: Calculate = Calculate()
    var myOperators: Operators = .none

    private init() { }

    func calculatedResultWithOperator(numberFirst: Float?, numberSecond: Float) -> Float? {
        guard let numberFirst = numberFirst else { return nil }
        switch self.myOperators {
        case .divide:
            return numberSecond == 0 ? nil : numberFirst / numberSecond
        case .mutiplied:
            return numberFirst * numberSecond
        case .plus:
            return numberFirst + numberSecond
        case .subtract:
            return numberFirst - numberSecond
        case .none:
            return numberSecond
        }
    }
}
