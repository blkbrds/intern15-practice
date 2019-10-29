//
//  CalculatorViewController.swift
//  BaiTapMVC
//
//  Created by PCI0018 on 10/28/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet private weak var resultLabel: UILabel!

    private let limitNumber: Float = 99999
    private var numberFirst: Float = 0
    private var numberSecond: Float = 0
    private var numberGetted: String = ""
    private var isCalculated: Bool = true
    private var shouldClearText: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    
    @IBAction private func chooseNumber(_ sender: UIButton) {
        getNumber(string: "\(sender.tag)")
    }

    @IBAction private func chooseOpertor(_ sender: UIButton) {
        switch sender.tag {
            // plus
        case 0:
            Calculate.share.myOperators = .plus
            calculateNumbers(string: "+")
            // subtract
        case 1:
            Calculate.share.myOperators = .subtract
            calculateNumbers(string: "-")
            // multiply
        case 2:

            Calculate.share.myOperators = .mutiplied
            calculateNumbers(string: "x")
            // divide
        case 3:
            Calculate.share.myOperators = .divide
            calculateNumbers(string: "/")
        default:
            break
        }
    }

    @IBAction private func clickOnEqualButton(_ sender: UIButton) {
        if isCalculated {
            resultLabel.text = "\(Results.result.result)"
            Calculate.share.myOperators = .none
        } else {
            if let result: Float = Calculate.share.calculatedResultWithOperator(numberFirst: numberFirst, numberSecond: numberSecond) {
                Results.result.setResult(r: result)
                resultLabel.text = "\(Results.result.result)"
                Calculate.share.myOperators = .none
                isCalculated = true
            }
        }
        shouldClearText = true
    }

    @IBAction private func clearButton(_ sender: Any) {
        resultLabel.text = ""
        Calculate.share.myOperators = .none
        Results.result.setResult(r: 0)
        numberFirst = 0
        numberSecond = 0
        numberGetted = ""
    }
    
    // MARK: - Private functions
    
    private func getNumber(string: String) {
        if shouldClearText {
            resultLabel.text = ""
            Calculate.share.myOperators = .none
            Results.result.setResult(r: 0)
            numberFirst = 0
            numberSecond = 0
            numberGetted = ""
            shouldClearText = false
        }
        resultLabel.text?.append(string)
        numberGetted.append(string)
        if let num = Int(numberGetted) {
            addNumber(num: num)
        }
    }

    private func addNumber(num: Int) {
        if isCalculated {
            Results.result.setResult(r: 0)
            numberFirst = Float(num)
        } else {
            numberSecond = Float(num)
        }
    }

    private func calculateNumbers(string: String) {
        resultLabel.text?.append(" \(string) ")
        numberGetted = ""
        isCalculated = false
        if let result: Float = Calculate.share.calculatedResultWithOperator(numberFirst: numberFirst, numberSecond: numberSecond) {
            Results.result.setResult(r: result)
        }
    }
}
