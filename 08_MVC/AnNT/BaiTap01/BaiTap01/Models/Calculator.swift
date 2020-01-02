//
//  Calculator.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/31/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import Foundation

final class Calculator {
  static func calcolator(numbers: [Int], calculators: [CalculatorEnum]) {
    guard !numbers.isEmpty, !calculators.isEmpty else { return }
    var result = numbers[0]
    for i in 1..<numbers.count {
      let number = numbers[i]
      let calculator = calculators[i-1]
      switch calculator {
      case .add:
        result += number
      case .sub:
        result -= number
      case .mul:
        result *= number
      case .div:
        result /= number
      }
    }
    Result.result = result
  }
}
