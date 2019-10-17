//
//  HomeViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/17/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
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
        view.addSubview(calculatorView!)
    }
    
    @IBAction private func showCalculatorView() {
        if let text1 = firstNumberTextField.text, !text1.isEmpty,
            let text2 = secondNumberTextField.text, !text2.isEmpty {
            calculatorView?.show()
        } else {
            let alert = UIAlertController(title: "Warning", message: "Nhap so can tinh", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
        guard let text1 = firstNumberTextField.text, let number1 = Float(text1),
            let text2 = secondNumberTextField.text, let number2 = Float(text2) else { return nil }
        return (number1, number2)
    }
}

extension HomeViewController: CalculatorViewDelegate {
    func calculatedResult(result: Float?) {
        guard let result = result else {
            resultLabel.text = "Result: Error"
            resultLabel.textColor = .systemRed
            return
        }
        resultLabel.textColor = .black
        resultLabel.text = "Result: \(result)"
    }
    
    func clear() {
        clearResult()
    }
}
