//
//  SelectView.swift
//  Baitap05
//
//  Created by PCI0008 on 1/10/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

protocol SelectViewDataSource: class {
    func passTheNumbers(for view: UIView) -> (a: Int, b: Int)
}

protocol SelectViewDelegate: class {
    func view(view: SelectView, needPerform acion: SelectView.Action)
}

class SelectView: UIView {
    
    enum Action {
        case clearDataOfTextFields
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var dataSource: SelectViewDataSource?
    private var x: Int?
    private var y: Int?
    weak var delegate: SelectViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configData()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configData(){
        let a = dataSource?.passTheNumbers(for: self).a
        let b = dataSource?.passTheNumbers(for: self).b
        x = a
        y = b
    }

    @IBAction private func touchUpInsideCancelButton(_ sender: Any) {
        self.hideViewWithAnimation()
    }
    
    @IBAction private func touchUpInsideDoneButton(_ sender: Any) {
        
    }
    
    @IBAction func touchUpInsidePlusButton(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x + y)"
    }
    
    @IBAction func touchUpInsideMinusButton(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x - y)"
    }
    
    @IBAction func touchUpInsideMultiplyButton(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x * y)"
    }
    
    @IBAction func touchUpInsideDivisonButton(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x / y)"
    }
    
    @IBAction func touchUpInsidePercentageButton(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x % y)"
    }
    
    @IBAction func touchUpInsidePowerButton(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(pow(Double(x), Double(y)))"
    }
    
    @IBAction func touchUpInsideClearButton(_ sender: Any) {
        hideViewWithAnimation()
        delegate?.view(view: self, needPerform: .clearDataOfTextFields)
    }
}
