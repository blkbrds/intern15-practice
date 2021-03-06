//
//  CalculatorViewController.swift
//  CalculatorMVC
//
//  Created by PCI0002 on 11/25/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

enum Error: String {
    case error = "ERROR"
    case overSize = "NAN"
}

extension String {
    func toInteger() -> String {
        guard let number = Float(self) else { return self }
        let temp = roundf(number)
        if temp - number == 0 {
            return "\(Int(temp))"
        }
        return self
    }
}

final class CalculatorViewController: UIViewController {

    @IBOutlet private weak var resultLabel: UILabel!

    private var number: Number = Number()
    private var isCaculated: Bool = false
    private let limitNumber: Float = 9999999

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }

    private func showResult(result: Float?) {
        guard let result = result else {
            resultLabel.text = Error.error.rawValue
            return
        }
        if result < limitNumber {
            resultLabel.text = String(result).toInteger()
        } else {
            resultLabel.text = Error.overSize.rawValue
        }
    }

    @IBAction private func numberButtonTouchUpInside(_ sender: UIButton) {
        if let _ = number.resultCalculated {
            guard number.inputNumber <= limitNumber else { return }
            number.convertToNumber(with: sender.tag)
            resultLabel.text = String(number.inputNumber).toInteger()
            isCaculated = true
        }
    }

    @IBAction private func operatorButtonTouchUpInside(_ sender: UIButton) {
        guard let _ = number.resultCalculated else { return }
        if isCaculated {
            number.resultCalculated = OperatorManager.shared().calculatedResultWithOperator(result: number.resultCalculated, number: number.inputNumber)
            showResult(result: number.resultCalculated)
        }
        switch sender.tag {
        case 10:
            OperatorManager.shared().operator = .plus
        case 11:
            OperatorManager.shared().operator = .subtract
        case 12:
            OperatorManager.shared().operator = .mutiplied
        case 13:
            OperatorManager.shared().operator = .divide
        default:
            break
        }
        number.inputNumber = 0
        isCaculated = false
    }

    @IBAction private func acButtonTouchUpInside(_ sender: UIButton) {
        resultLabel.text = "0"
        isCaculated = false
        number.inputNumber = 0
        number.resultCalculated = 0
        OperatorManager.shared().operator = .none
    }

    @IBAction private func equalButtonTouchUpInside(_ sender: Any) {
        number.resultCalculated = OperatorManager.shared().calculatedResultWithOperator(result: number.resultCalculated, number: number.inputNumber)
        showResult(result: number.resultCalculated)
        OperatorManager.shared().operator = .none
        guard let result = number.resultCalculated else { return }
        number.inputNumber = result
    }
}
