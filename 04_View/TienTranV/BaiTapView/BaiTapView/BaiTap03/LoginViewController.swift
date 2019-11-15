//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!

    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!

    private let username = "Admin"
    private let admin = "Admin123"

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        passWordTextField.delegate = self
        userNameTextField.delegate = self
        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(tapToScreen(_:)))
        view.addGestureRecognizer(tapToScreen)
        loginButton.addTarget(self, action: #selector(tapLoginButton(_:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(tapClearButton(_:)), for: .touchUpInside)
    }

    private func initView() {
        setUpUITextField(textField: userNameTextField)
        setUpUITextField(textField: passWordTextField)
        setUpButton(button: clearButton)
        setUpButton(button: loginButton)

        errorLabel.isHidden = true
        passWordTextField.isSecureTextEntry = true
    }

    private func setUpUITextField(textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
    }

    private func setUpButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
    }

    private func exception(stringData: (String, String)) -> String {
        var errorString = ""

        switch stringData {
        case ("", ""):
            errorString = "Bạn chưa nhập dữ liệu"
        case ("", _):
            errorString = "Bạn chưa điền username"
        case (_, ""):
            errorString = "Bạn chưa điền password"
        default:
            errorString = "Nhập sai tên username hoặc password"
        }

        return errorString
    }

    private func login() {
        let stringData: (String, String) = (userNameTextField.text ?? "", passWordTextField.text ?? "")

        if stringData == (username, admin) {
            errorLabel.isHidden = true
            print("Đăng nhập thành công")
        } else {
            errorLabel.isHidden = false
            errorLabel.text = exception(stringData: stringData)
            errorLabel.textColor = .red
        }
    }

    @objc private func tapLoginButton(_ sender: Any) {
        login()
        passWordTextField.endEditing(true)
    }

    @objc private func tapClearButton(_ sender: Any) {
        userNameTextField.text = nil
        passWordTextField.text = nil
        errorLabel.isHidden = true
    }

    @objc private func tapToScreen(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            self.passWordTextField.becomeFirstResponder()
        }
        if textField.tag == 1 {
            login()
        }
    }
}
