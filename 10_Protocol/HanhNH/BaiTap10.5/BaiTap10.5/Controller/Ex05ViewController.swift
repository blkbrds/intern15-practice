//
//  Ex05ViewController.swift
//  BaiTap10.5
//
//  Created by ANH NGUYỄN on 11/10/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class Ex05ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var leftTextField: UITextField!

    private var calculatorView: CalculatorView?
    private var customView = Bundle.main.loadNibNamed("CalculatorView", owner: self, options: nil)?.first as? CalculatorView

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        if let customView = customView {
            let frame = CGRect(x: 0, y: view.bounds.height - customView.bounds.height - 50, width: view.bounds.width, height: 300)
            customView.frame = frame
            customView.dataSource = self
            customView.delegate = self
            view.addSubview(customView)
        }
    }
    func setupNavi() {

    }
    @IBAction func tagRamdomButton(_ sender: UIButton) {

        if leftTextField.text == "" || rightTextField.text == "" {
            let comment = UIAlertController(title: "Sai", message: "Bạn nhập thiếu hoặc chưa nhập", preferredStyle: .alert)
            comment.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(comment, animated: true, completion: nil)
        } else {
            customView?.show(animation: true)
        }
    }
}

extension Ex05ViewController: CalculatorDataSource {
    func getFirstSecond() -> (first: Float?, second: Float?) {
        if let firstText = leftTextField.text, let firstNumber = Float(firstText), let secondText = rightTextField.text, let secondNumber = Float(secondText) {
            return (firstNumber, secondNumber)
        }
        return (0, 0)
    }
}
extension Ex05ViewController: CalculatorDelegate {
    func resultDelegate(view: CalculatorView, needsPerform action: CalculatorView.Results) {
        switch action {
        case .calculatorResult(let results):
            resultLabel.text = "Results :  \(results)"
        }
    }
}
