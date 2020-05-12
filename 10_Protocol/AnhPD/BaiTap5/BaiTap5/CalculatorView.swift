//
//  CalculatorView.swift
//  BaiTap5
//
//  Created by PCI0012 on 5/8/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol CalculatorViewDataSource: class {
    func getValueX() -> String
    func getValueY() -> String
}

protocol CalculatorViewDelegate: class {
    func done(result: Int)
}

protocol ClearDelegate: class {
    func clear()
}

class CalculatorView: UIView {
    
    @IBOutlet weak var valueXTextField: UITextField!
    @IBOutlet weak var valueYTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    
    var a: Int = 0
    var b: Int = 0
    var result: Int = 0
    weak var dataSource: CalculatorViewDataSource?
    weak var delegate: CalculatorViewDelegate?
    weak var delegate1: ClearDelegate?
    
    func updateUI() {
        valueXTextField.text = dataSource?.getValueX()
        valueYTextField.text = dataSource?.getValueY()
    }
    
    @IBAction func plusButtonTouchUpInSide(_ sender: Any) {
        if let valueX = valueXTextField.text, let valueY = valueYTextField.text {
            a = Int(valueX) ?? 0
            b = Int(valueY) ?? 0
            result = a + b
            resultTextField.text = String(result)
        }
    }
    
    @IBAction func subButtonTouchUpInSide(_ sender: Any) {
        if let valueX = valueXTextField.text, let valueY = valueYTextField.text {
            a = Int(valueX) ?? 0
            b = Int(valueY) ?? 0
            result = a - b
            resultTextField.text = String(result)
        }
    }
    
    @IBAction func mulButtonTouchUpInSide(_ sender: Any) {
        if let valueX = valueXTextField.text, let valueY = valueYTextField.text {
            a = Int(valueX) ?? 0
            b = Int(valueY) ?? 0
            result = a * b
            resultTextField.text = String(result)
        }
    }
    
    @IBAction func divButtonTouchUpInSide(_ sender: Any) {
        if let valueX = valueXTextField.text, let valueY = valueYTextField.text {
            a = Int(valueX) ?? 0
            b = Int(valueY) ?? 0
            result = a / b
            resultTextField.text = String(result)
        }
    }
    
    @IBAction func percentButtonTouchUpInSide(_ sender: Any) {
        if let valueX = valueXTextField.text, let valueY = valueYTextField.text {
            a = Int(valueX) ?? 0
            b = Int(valueY) ?? 0
            result = a % b
            resultTextField.text = String(result)
        }
    }
    
    @IBAction func cancleButtonTouchUpInSide(_ sender: Any) {
        self.isHidden = true
    }
    
    @IBAction func doneButtonTouchUpInSide(_ sender: Any) {
        self.isHidden = true
        if let delegate = delegate {
            delegate.done(result: result)
        }
    }
    
    @IBAction func clearButtonTouchUpInSide(_ sender: Any) {
        self.isHidden = true
        if let delegate1 = delegate1 {
            delegate1.clear()
        }
    }
}
