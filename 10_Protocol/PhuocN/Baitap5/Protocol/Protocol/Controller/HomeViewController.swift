//
//  HomeViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/17/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var firstNumberTextField: UITextField!
    @IBOutlet private weak var secondNumberTextField: UITextField!
    
    private var calculatorView: CalculatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorView = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView
        calculatorView?.frame = view.frame
        calculatorView?.config()
        calculatorView?.delegate = self
        calculatorView?.dataSource = self
        guard let calculatorView = calculatorView else { return }
        view.addSubview(calculatorView)
    }
    
    @IBAction private func showCalculatorView() {
        if let text1 = firstNumberTextField.text, !text1.isEmpty,
            let text2 = secondNumberTextField.text, !text2.isEmpty {
            calculatorView?.show()
        } else {
            let alert = UIAlertController(title: "Warning", message: "Nhap so can tinh", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func clearResult() {
        firstNumberTextField.text = ""
         secondNumberTextField.text = ""
        resultLabel.text = ""
    }
}

extension HomeViewController: CalculatorViewDataSource {
    func getNumberToCalculated() -> (number1: Float, number2: Float)? {
        guard let firstString = firstNumberTextField.text, let firstNumber = Float(firstString),
            let secondString = secondNumberTextField.text, let secondNumber = Float(secondString) else { return nil }
        return (firstNumber, secondNumber)
    }
}

extension HomeViewController: CalculatorViewDelegate {
    func calculatorView(_ view: CalculatorView, result: Float?, needPerform action: CalculatorView.Action) {
        guard let result = result else {
            resultLabel.text = "Result: Error"
            resultLabel.textColor = .systemRed
            return
        }
        resultLabel.textColor = .black
        resultLabel.text = "Result: \(result)"
    }
    
    func calculatorView(_ view: CalculatorView, needPerform action: CalculatorView.Action) {
        clearResult()
    }
}
