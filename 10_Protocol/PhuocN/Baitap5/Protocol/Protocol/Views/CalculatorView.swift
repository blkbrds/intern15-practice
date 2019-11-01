//
//  CalculatorView.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/17/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol CalculatorViewDelegate: class {
    func calculatorView(_ view: CalculatorView, result: Float?, needPerform action: CalculatorView.Action)
    func calculatorView(_ view: CalculatorView, needPerform action: CalculatorView.Action)
}

protocol CalculatorViewDataSource: class {
    func getNumberToCalculated() -> (number1: Float, number2: Float)?
}

final class CalculatorView: UIView {
    
    enum Action {
        case calculatorResult
        case clear
    }
    
    enum Operators: String {
        case plus = "+"
        case mutiplied = "X"
        case divide = "/"
        case subtract = "-"
        case exponent = "x^y"
        case none
    }
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var secondNumberLabel: UILabel!
    @IBOutlet private weak var firstNumberLabel: UILabel!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var maskBackgroundView: UIView!
    
    private var `operator`: Operators = .none
    private var result: Float?
    private var number1: Float = 0
    private var number2: Float = 0
    weak var delegate: CalculatorViewDelegate?
    weak var dataSource: CalculatorViewDataSource?
    
    func config() {
        hide(animation: false)
    }
    
    @IBAction private func cancel() {
        hide()
    }
    
    @IBAction private func done() {
        hide()
        delegate?.calculatorView(self, result: result, needPerform: .calculatorResult)
    }
    
    @IBAction private func changeOperator(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case Operators.divide.rawValue:
            `operator` = .divide
        case Operators.plus.rawValue:
            `operator` = .plus
        case Operators.subtract.rawValue:
            `operator` = .subtract
        case Operators.exponent.rawValue:
            `operator` = .exponent
        case Operators.mutiplied.rawValue:
            `operator` = .mutiplied
        default:
            `operator` = .none
        }
        guard let caculatedResult = calculatedResultWithOperator(number1: number1, number2: number2) else {
            resultLabel.text = "Error"
            result = nil
            return
        }
        resultLabel.text = String(caculatedResult)
        result = caculatedResult
    }
    
    @IBAction private func clear() {
        hide()
        delegate?.calculatorView(self, needPerform: .clear)
    }
    
    func show(animation: Bool = true) {
        if let firstNumber = dataSource?.getNumberToCalculated()?.number1,
            let secondNumber = dataSource?.getNumberToCalculated()?.number2 {
            number1 = firstNumber
            number2 = secondNumber
        }
        firstNumberLabel.text = String(number1)
        secondNumberLabel.text = String(number2)
        resultLabel.text = ""
        self.operator = .none
        isHidden = false
        var frame = contentView.frame
        frame.origin.y -= frame.size.height
        if animation {
            UIView.animate(withDuration: 0.5) {
                self.maskBackgroundView.alpha = 0.7
                self.contentView.frame = frame
            }
        } else {
            self.contentView.frame = frame
        }
    }
    
    func hide(animation: Bool = true) {
        var frame = contentView.frame
        frame.origin.y += frame.size.height
        if animation {
            UIView.animate(withDuration: 0.5, animations: {
                self.maskBackgroundView.alpha = 0
                self.contentView.frame = frame
            }) { (_) in
                self.isHidden = true
            }
        } else {
            self.contentView.frame = frame
            self.isHidden = true
        }
    }
    
    private func calculatedResultWithOperator(number1: Float, number2: Float) -> Float? {
        switch self.operator {
        case .divide:
            return number2 == 0 ? nil : number1 / number2
        case .mutiplied:
            return number1 * number2
        case .plus:
            return number1 + number2
        case .subtract:
            return number1 - number2
        case .exponent:
            var result: Float = 1
            for _ in 0..<Int(number2) {
                result *= number1
            }
            return result
        case .none:
            return nil
        }
    }
}
