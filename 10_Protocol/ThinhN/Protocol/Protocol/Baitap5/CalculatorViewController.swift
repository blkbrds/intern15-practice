//
//  CalculatorViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/25/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var operatorView: UIView!
    @IBOutlet weak var xValueTextField: UITextField!
    @IBOutlet weak var yValueTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var calculator: CalculatorView?
    var x: String = ""
    var y: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getValue() {
        if let x = xValueTextField.text, let y = yValueTextField.text {
            self.x = x
            self.y = y
        }
    }
    
    func setupView() {
        getValue()
        calculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)? [0] as? CalculatorView
        guard let calculator = calculator else {return}
        calculator.datasource = self
        calculator.delegate = self 
        calculator.sendValue()
        calculator.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        operatorView.addSubview(calculator)
    }
    
    @IBAction func showCalculatorButtonTouchUpInside(_ sender: Any) {
        setupView()
    }
}
extension CalculatorViewController: CalculatorViewDatasource {
    func getXValue() -> String {
        return x
    }
    func getYValue() -> String {
        return y
    }
}
extension CalculatorViewController: CalculatorViewDelegate {
    func touchClearButton() {
        xValueTextField.text = ""
        yValueTextField.text = ""
    }
    func touchDoneButton(result: String) {
        resultLabel.text = "Result: \(result)"
    }
}
