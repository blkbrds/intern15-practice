//
//  CalculatorViewController.swift
//  BaiTap05
//
//  Created by PCI0002 on 12/3/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class CalculatorViewController: BaseViewController {

    @IBOutlet private weak var xTextField: UITextField!
    @IBOutlet private weak var yTextField: UITextField!
    @IBOutlet private weak var operatorButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!

    private var calculatorView: CalculatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func setupUI() {
        super.setupUI()
        setupCustumView()
    }

    private func setupCustumView() {
        calculatorView = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView
        let calculatorViewHeight = CGFloat(300)
        calculatorView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - calculatorViewHeight, width: UIScreen.main.bounds.width, height: calculatorViewHeight)
        calculatorView?.delegate = self
        calculatorView?.datasource = self
        guard let calculatorView = calculatorView else { return }
        view.addSubview(calculatorView)
        calculatorView.alpha = 0
        calculatorView.isHidden = true
    }

    @IBAction private func operatorTouchUpInside(_ sender: Any) {
        if let xString = xTextField?.text, !xString.isEmpty,
            let yString = yTextField?.text, !yString.isEmpty {
            guard let calculatorView = calculatorView else { return }
            UIView.animate(withDuration: 5) {
                calculatorView.updateUI()
                calculatorView.isHidden = false
                calculatorView.alpha = 1
            }
        }
    }
}

extension CalculatorViewController: CalculatorViewDatasource {
    func getX() -> Int? {
        guard let xString = self.xTextField.text, let x = Int(xString) else { return nil }
        return x
    }

    func getY() -> Int? {
        guard let yString = self.yTextField.text, let y = Int(yString) else { return nil }
        return y
    }
}

extension CalculatorViewController: CalculatorViewDelegate {
    func view(view: CalculatorView, needPerformAciton action: CalculatorView.Action) {
        switch action {
        case .sendResultToVC(let `operator`, let result):
            resultLabel.text = "\(result) ="
            operatorButton.setTitle(`operator`, for: .normal)
        case .cancel: break
        case .clear:
            xTextField.text = ""
            yTextField.text = ""
            resultLabel.text = ".........="
        }
        guard let calculatorView = calculatorView else { return }
        UIView.animate(withDuration: 5) {
            calculatorView.isHidden = true
            calculatorView.alpha = 0
        }
    }
}
