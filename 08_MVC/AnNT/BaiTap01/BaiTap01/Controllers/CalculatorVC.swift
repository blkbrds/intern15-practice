//
//  CalculatorVC.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/31/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
  @IBOutlet weak var resultLabel: UILabel!

  private var titleResult: String = ""
  private var numberString: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func handleClickNumber(_ sender: UIButton) {
    let title = sender.titleLabel?.text ?? ""
    titleResult += title
    numberString += title
    resultLabel.text = titleResult
  }

  @IBAction func handleCalculator(_ sender: UIButton) {
    let text = resultLabel.text ?? ""
    guard text != "0" else { return }
    let title = sender.titleLabel?.text ?? ""
    if text.hasSuffix("+") || text.hasSuffix("-") || text.hasSuffix("x") || text.hasSuffix("/") {
      titleResult.removeLast()
      Result.calculators.removeLast()
    }
    let calculatorStr = title
    titleResult += calculatorStr
    resultLabel.text = titleResult
    Result.addNumber(numberStr: numberString)
    Result.addCalculator(calculatorStr: calculatorStr)
    numberString = ""
  }

  @IBAction func acButton(_ sender: UIButton) {
    resultLabel.text = "0"
    titleResult = ""
    Result.numbers = []
    Result.calculators = []
    Result.result = 0
  }
  
  @IBAction func handleResult(_ sender: Any) {
    Result.addNumber(numberStr: numberString)
    Calculator.calcolator(numbers: Result.numbers, calculators: Result.calculators)
    resultLabel.text = "\(titleResult) = \(Result.result)"
    numberString = ""
    print(Result.numbers)
    print(Result.calculators)
    print(Result.result)
  }
}
