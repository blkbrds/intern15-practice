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
    @IBOutlet weak var resultLabel: UILabel!

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
        calculatorView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 300, width: UIScreen.main.bounds.width, height: 300)
        calculatorView?.delegate = self
        calculatorView?.datasoucre = self
        guard let calculatorView = calculatorView else { return }
        view.addSubview(calculatorView)
        calculatorView.alpha = 0
        calculatorView.isHidden = true
    }

    @IBAction private func operatorTouchUpInside(_ sender: Any) {
        if xTextField?.text != ""
            , yTextField?.text != "" {
            guard let calculatorView = calculatorView else { return }
            UIView.animate(withDuration: 5) {
                calculatorView.updateUI()
                calculatorView.isHidden = false
                calculatorView.alpha = 1
            }
        }
    }
}

extension CalculatorViewController: CalculatorViewDatasource, CalculatorViewDelegate {
    func customView(customView: CalculatorView, needPerformAciton action: CalculatorView.Action) {
        switch action {
        case .sendResultToVC(let operatorButton, let result):
            self.resultLabel.text = "\(result) ="
            self.operatorButton.setTitle(operatorButton, for: .normal)
        case .cancel: break
        case .clear:
            self.xTextField.text = ""
            self.yTextField.text = ""
            self.resultLabel.text = ".........="
        }
        guard let calculatorView = calculatorView else { return }
        UIView.animate(withDuration: 5) {
            calculatorView.isHidden = true
            calculatorView.alpha = 0
        }
    }

    func getX() -> Int? {
        guard let xString = self.xTextField.text, let x = Int(xString) else { return nil }
        return x
    }

    func getY() -> Int? {
        guard let yString = self.yTextField.text, let y = Int(yString) else { return nil }
        return y
    }
}
