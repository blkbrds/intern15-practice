//
//  Calculator.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/31/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import Foundation

enum CalculatorEnum {
  case add, sub, mul, div
}

final class Calculator {
  var numbers: [Int] = []
  var calculators: [CalculatorEnum] = []
  var result: Int = 0
  
  static let share = Calculator()

  func calculator() {
    guard !numbers.isEmpty, !calculators.isEmpty else { return }
    var result = numbers[0]
    for i in 1..<numbers.count {
      let number = numbers[i]
      let calculator = calculators[i - 1]
      switch calculator {
      case .add:
        result += number
      case .sub:
        result -= number
      case .mul:
        result *= number
      case .div:
        result = number == 0 ? 0 : result / number
      }
    }
    self.result = result
  }

  func addNumber(numberStr: String) {
    guard let number = Int(numberStr) else { return }
    self.numbers.append(number)
  }

  func addCalculator(calculatorStr: String) {
    switch calculatorStr {
    case "+":
      self.calculators.append(.add)
    case "-":
      self.calculators.append(.sub)
    case "x":
      self.calculators.append(.mul)
    case "/":
      self.calculators.append(.div)
    default:
      return
    }
  }
}
