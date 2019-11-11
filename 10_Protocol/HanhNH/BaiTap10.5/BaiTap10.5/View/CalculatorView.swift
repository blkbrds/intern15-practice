//
//  CalculatorView.swift
//  BaiTap10.5
//
//  Created by ANH NGUYỄN on 11/10/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
protocol CalculatorDelegate: class {
    func resultDelegate(view: CalculatorView, needsPerform aciton: CalculatorView.Results)
}
protocol CalculatorDataSource: class {
    func getFirstSecond() -> (first: Float?, second: Float?)
}
final class CalculatorView: UIView {

    enum Results {
        case calculatorResult(Float)
    }
    enum Design: String {
        case plus = "+"
        case mutiplied = "X"
        case divide = "/"
        case subtract = "-"
        case exponent = "x^y"
        case percent = "%"
        case none
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var secondNumberLabel: UILabel!

    private var desgin: Design = .none
    private var result: Float?
    private var first: Float = 0
    private var second: Float = 0
    weak var delegate: CalculatorDelegate?
    weak var dataSource: CalculatorDataSource? {
        didSet {
            guard let fist = dataSource?.getFirstSecond().first, let second = dataSource?.getFirstSecond().second else { return }
            firstNumberLabel.text = String(fist)
            secondNumberLabel.text = String(second)
        }
    }

    @IBAction func cancel(_ sender: Any) {
        contentView.alpha = 0
    }

    @IBAction func done(_ sender: Any) {

    }

    @IBAction func clear(_ sender: Any) {
        contentView.alpha = 0
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.alpha = 0
    }

    func show(animation: Bool) {
        if let firstNumber = dataSource?.getFirstSecond().first,
            let secondNumber = dataSource?.getFirstSecond().second {
            first = firstNumber
            second = secondNumber
        }
        firstNumberLabel.text = String(first)
        secondNumberLabel.text = String(second)
        UIView.animate(withDuration: 0.5) {
            self.contentView.alpha = 1
        }

    }
    @IBAction func changeOperator(_sender: UIButton) {
        switch _sender.titleLabel?.text {
        case Design.divide.rawValue:
            desgin = .divide
        case Design.exponent.rawValue:
            desgin = .exponent
        case Design.mutiplied.rawValue:
            desgin = .mutiplied
        case Design.plus.rawValue:
            desgin = .plus
        case Design.subtract.rawValue:
            desgin = .subtract
        case Design.percent.rawValue:
            desgin = .percent
        default:
            desgin = .none
        }
        if let calcuatedResult = quickCalculation(first: first, second: second) {
            resultLabel.text = String(calcuatedResult)
            result = calcuatedResult
        } else {
            resultLabel.text = "không có số"
            result = nil
        }
    }
    private func quickCalculation (first: Float, second: Float) -> Float? {
        switch self.desgin {
        case .plus:
            result = first + second
            delegate?.resultDelegate(view: self, needsPerform: .calculatorResult(result ?? 0))
            return result
        case .divide:
            if second == 0 {
                resultLabel.text = "không thể chia 0"
            } else { result = first / second }
            delegate?.resultDelegate(view: self, needsPerform: .calculatorResult(result ?? 0))
            return result
        case .mutiplied:
            result = first * second
            delegate?.resultDelegate(view: self, needsPerform: .calculatorResult(result ?? 0))
            return result
        case .exponent:
            var index: Float = 1
            for _ in 0..<Int(second) {
                index *= first
                result = index
            }
            delegate?.resultDelegate(view: self, needsPerform: .calculatorResult(result ?? 0))
            return result
        case .subtract:
            result = first - second
            delegate?.resultDelegate(view: self, needsPerform: .calculatorResult(result ?? 0))
            return result
        case .percent:
            result = Float(Int(first) - (Int(first) / Int(second)) * Int(second))
            delegate?.resultDelegate(view: self, needsPerform: .calculatorResult(result ?? 0))
            return result
        case .none:
            return nil

        }
    }
}
