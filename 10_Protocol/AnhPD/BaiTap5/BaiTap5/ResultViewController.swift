//
//  ResultViewController.swift
//  BaiTap5
//
//  Created by PCI0012 on 5/8/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var valueXTextField: UITextField!
    @IBOutlet weak var valueYTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    
    var valueX: String = ""
    var valueY: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectionButtonTouchUpInSide(_ sender: Any) {
        setupUI()
        let calculator = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView
        if let calculator = calculator {
            calculator.frame = CGRect(x: 0, y: UIScreen.main.bounds.height / 3, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            calculator.dataSource = self
            calculator.delegate = self
            calculator.delegate1 = self
            calculator.updateUI()
            view.addSubview(calculator)
        }
        
    }
    
    func setupUI() {
        if let valueX = valueXTextField.text {
            self.valueX = valueX
        }
        if let valueY = valueYTextField.text {
            self.valueY = valueY
        }
    }
}

extension ResultViewController: CalculatorViewDataSource {
    func getValueX() -> String {
        return valueX
    }
    
    func getValueY() -> String {
        return valueY
    }
}

extension ResultViewController: CalculatorViewDelegate {
    func done(result: Int) {
        resultTextField.text = String(result)
    }
}

extension ResultViewController: ClearDelegate {
    func clear() {
        valueXTextField.text = ""
        valueYTextField.text = ""
    }
}
