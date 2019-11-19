//
//  MyDatePickerViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0002 on 11/18/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MyDatePickerViewController: UIViewController {

    @IBOutlet private weak var myDatePickerView: MyDatePickerView!
    @IBOutlet private weak var dateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        myDatePickerView.delegate = self
        dateTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension MyDatePickerViewController: MyDatePickerViewDelegate {
    func sendDateValue(view: MyDatePickerView, needsPerform action: MyDatePickerView.Action) {
        switch action {
        case .sendDate(let date):
            dateTextField.text = date
            view.hide()
        }
    }
}

extension MyDatePickerViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        myDatePickerView.show()
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.endEditing(true)
    }
}
