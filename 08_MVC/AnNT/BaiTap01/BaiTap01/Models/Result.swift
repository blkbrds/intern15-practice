//
//  Result.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/31/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import Foundation

enum CalculatorEnum {
  case add, sub, mul, div
}

final class Result {
  static var numbers: [Int] = []
  static var calculators: [CalculatorEnum] = []
  static var result: Int = 0

  static func addNumber(numberStr: String) {
    guard let number = Int(numberStr) else { return }
    Result.numbers.append(number)
  }

  static func addCalculator(calculatorStr: String) {
    switch calculatorStr {
      case "+":
        Result.calculators.append(.add)
      case "-":
        Result.calculators.append(.sub)
      case "x":
        Result.calculators.append(.mul)
      case "/":
        Result.calculators.append(.div)
      default:
        return
    }
  }
}
