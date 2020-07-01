//
//  CalculatorView.swift
//  Protocol
//
//  Created by PCI0019 on 6/25/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol CalculatorViewDatasource: class {
    func getXValue() -> String
    func getYValue() -> String
}
protocol CalculatorViewDelegate: class {
    func touchClearButton()
    func touchDoneButton(result: String)
}
class CalculatorView: UIView {
    
    weak var datasource: CalculatorViewDatasource?
    weak var delegate: CalculatorViewDelegate?
    var result: Int = 0
    var x1: Int = 0
    var x2: Int = 0
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var resultTextField: UILabel!
    @IBOutlet weak var yValueTextField: UILabel!
    @IBOutlet weak var xValueTextField: UILabel!
    
    @IBAction func cancelButtonTouchUpInside(_ sender: Any) {
        self.isHidden = true
        delegate?.touchClearButton()
    }
    @IBAction func doneButtonTouchUpInside(_ sender: Any) {
        delegate?.touchDoneButton(result: String(result))
         self.isHidden = true
    }
    
    @IBAction func plusButtonTouchUpInside(_ sender: Any) {
        guard let x = datasource?.getXValue(), let y = datasource?.getYValue() else { return }
        x1 = Int(x) ?? 0
        x2 = Int(y) ?? 0
        result = x1 + x2
        resultTextField.text = String(result)
    }
    @IBAction func subButtonTouchUpInside(_ sender: Any) {
        guard let x = datasource?.getXValue(), let y = datasource?.getYValue() else { return }
        x1 = Int(x) ?? 0
        x2 = Int(y) ?? 0
        result = x1 - x2
        resultTextField.text = String(result)
    }
    @IBAction func mulButtonTouchUpInside(_ sender: Any) {
        guard let x = datasource?.getXValue(), let y = datasource?.getYValue() else { return }
        x1 = Int(x) ?? 0
        x2 = Int(y) ?? 0
        result = x1 * x2
        resultTextField.text = String(result)
    }
    @IBAction func divButtonTouchUpInside(_ sender: Any) {
        guard let x = datasource?.getXValue(), let y = datasource?.getYValue() else { return }
        x1 = Int(x) ?? 0
        x2 = Int(y) ?? 0
        result = x1 / x2
        resultTextField.text = String(result)
    }
    @IBAction func percentButtonTouchUpInside(_ sender: Any) {
        guard let x = datasource?.getXValue(), let y = datasource?.getYValue() else { return }
        x1 = Int(x) ?? 0
        x2 = Int(y) ?? 0
        result = x1 % x2
        resultTextField.text = String(result)
    }
    @IBAction func powButtonTouchUpInside(_ sender: Any) {
        guard let x = datasource?.getXValue(), let y = datasource?.getYValue() else { return }
        x1 = Int(x) ?? 0
        x2 = Int(y) ?? 0
        result = Int(pow(Double(x1), Double(x2)))
        resultTextField.text = String(result)
    }
    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        delegate?.touchClearButton()
        self.isHidden = true 
    }
}
