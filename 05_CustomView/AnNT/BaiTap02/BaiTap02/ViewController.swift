//
//  ViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {

    var mySliderView: MySliderView!
    let valueTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(handleChangedValue), for: .valueChanged)
        return textField
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupUI()
        mySliderView.delegate = self
    }

    private func setupUI() {
        view.backgroundColor = .white
        let valueView = UIView(frame: CGRect(x: view.bounds.width / 2 - 80, y: 44, width: 160, height: 45))
        view.addSubview(valueView)
        valueLabel.frame = CGRect(x: 0, y: 0, width: 60, height: 45)
        valueTextField.frame = CGRect(x: valueLabel.frame.maxX, y: 0, width: 100, height: 45)
        valueView.addSubview(valueLabel)
        valueView.addSubview(valueTextField)
        mySliderView = MySliderView(frame: CGRect(x: view.bounds.width / 2 - 20, y: view.bounds.height / 2 - 200, width: 40, height: 400))
        view.addSubview(mySliderView)
    }

    @objc func handleChangedValue(sender: UITextField) {
        mySliderView.touchControlLabel.text = "\(String(describing: sender.text))%"
    }
}

extension ViewController: MySliderDelegate {
    func valueChanged(sliderView: MySliderView, value: CGFloat) {
        self.valueTextField.text = "\(Int(value))"
    }
}

