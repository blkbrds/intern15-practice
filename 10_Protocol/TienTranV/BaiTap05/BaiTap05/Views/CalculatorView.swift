//
//  CalculatorView.swift
//  BaiTap05
//
//  Created by PCI0002 on 12/3/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol CalculatorViewDatasource: class {
    func getX() -> Int?
    func getY() -> Int?
}

protocol CalculatorViewDelegate: class {
    func view(view: CalculatorView, needPerformAciton action: CalculatorView.Action)
}

final class CalculatorView: UIView {

    enum Action {
        case sendResultToVC(operatorButton: String, result: Double)
        case cancel
        case clear
    }

    @IBOutlet private weak var xLabel: UILabel!
    @IBOutlet private weak var yLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!

    weak var datasource: CalculatorViewDatasource?
    weak var delegate: CalculatorViewDelegate?

    var x: Int?
    var y: Int?
    var result: Double?
    var operatorButton: String?
    
    func updateUI() {
        guard let x = datasource?.getX(), let y = datasource?.getY() else { return }
        xLabel.text = String(x)
        yLabel.text = String(y)
        resultLabel.text = ""
    }

    @IBAction private func buttonsTouchUpInside(_ sender: UIButton) {
        guard let x = datasource?.getX(), let y = datasource?.getY() else { return }
        switch sender.tag {
        case 1:
            operatorButton = "+"
            result = Double(x + y)
        case 2:
            operatorButton = "-"
            result = Double(x - y)
        case 3:
            operatorButton = "x"
            result = Double(x * y)
        case 4:
            operatorButton = "/"
            result = Double(x / y)
        case 5:
            operatorButton = "%"
            result = Double(x % y)
        case 6:
            operatorButton = "^"
            result = pow(Double(x), Double(y))
        default:
            clearAction()
        }
        guard let result = result else { return }
        resultLabel.text = String(result)
    }

    private func clearAction() {
        delegate?.view(view: self, needPerformAciton: .clear)
    }

    @IBAction private func doneTouchUpInside(_ sender: Any) {
        guard let result = result, let operatorButton = operatorButton else { return }
        delegate?.view(view: self, needPerformAciton: .sendResultToVC(operatorButton: operatorButton, result: result))
    }

    @IBAction private func cancelTouchUpInside(_ sender: Any) {
        delegate?.view(view: self, needPerformAciton: .cancel)
    }
}
