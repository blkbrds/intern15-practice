//
//  loginViewController.swift
//  baitap4.3
//
//  Created by user on 11/13/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class loginViewController: UIViewController {
    private let userName: String = "admin"
    private let password: String = "admin123"

    enum Error: String {
        case khongNhap = "Ban chua nhap gi ca"
        case nhapSai = "Ban da nhap sai"
        case thieu = "Ban nhap thieu roi"
    }

    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        userTextField.delegate = self
        userTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func login () {
        switch (userTextField.text, passwordTextField.text) {
        case ("", ""):
            commentLabel.text = Error.khongNhap.rawValue
        case (userName, password):
            commentLabel.text = "Chúc mừng bạn đã đăng nhập thành công"
        case ("", _), (_, ""):
            commentLabel.text = Error.thieu.rawValue
        default:
            commentLabel.text = Error.nhapSai.rawValue
        }
        view.endEditing(true)
    }

    @IBAction private func tapLoginButton(_ sender: Any) {
        login()
    }

    @IBAction private func tapClearButton(_ sender: Any) {
        userTextField.text = ""
        passwordTextField.text = ""
    }
}

extension loginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder()
        }
        if textField.tag == 1 {
            login()
        }
    }
}

