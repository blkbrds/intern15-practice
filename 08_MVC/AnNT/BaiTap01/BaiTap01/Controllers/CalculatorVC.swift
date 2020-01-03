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
      Calculator.share.calculators.removeLast()
    }
    let calculatorStr = title
    titleResult += calculatorStr
    resultLabel.text = titleResult
    Calculator.share.addNumber(numberStr: numberString)
    Calculator.share.addCalculator(calculatorStr: calculatorStr)
    numberString = ""
  }

  @IBAction func acButton(_ sender: UIButton) {
    resultLabel.text = "0"
    titleResult = ""
    Calculator.share.numbers = []
    Calculator.share.calculators = []
    Calculator.share.result = 0
  }
  
  @IBAction func handleResult(_ sender: Any) {
    Calculator.share.addNumber(numberStr: numberString)
    Calculator.share.calculator()
    resultLabel.text = "\(titleResult) = \(Calculator.share.result)"
    numberString = ""
    print(Calculator.share.numbers)
    print(Calculator.share.calculators)
    print(Calculator.share.result)
  }
}
