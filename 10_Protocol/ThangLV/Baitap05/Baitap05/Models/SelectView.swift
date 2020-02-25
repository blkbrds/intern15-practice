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

    @IBAction private func cancelButtonTouchUpInside(_ sender: Any) {
        self.hideViewWithAnimation()
    }
    
    @IBAction private func doneButtonTouchUpInside(_ sender: Any) {
        
    }
    
    @IBAction private func plusButtonTouchUpInside(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x + y)"
    }
    
    @IBAction private func minusButtonTouchUpInside(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x - y)"
    }
    
    @IBAction private func multiplyButtonTouchUpInside(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x * y)"
    }
    
    @IBAction private func divisionButtonTouchUpInside(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x / y)"
    }
    
    @IBAction private func percentageButtonTouchUpInside(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(x % y)"
    }
    
    @IBAction private func powerButtonTouchUpInside(_ sender: Any) {
        guard let x = x, let y = y else { return }
        resultLabel.text = "Result = \(pow(Double(x), Double(y)))"
    }
    
    @IBAction private func clearButtonTouchUpInside(_ sender: Any) {
        hideViewWithAnimation()
        delegate?.view(view: self, needPerform: .clearDataOfTextFields)
    }
}
