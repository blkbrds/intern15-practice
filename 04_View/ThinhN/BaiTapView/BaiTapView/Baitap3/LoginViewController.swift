//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/19/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//
import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!

    private let validUsername = "Admin"
    private let validPassword = "Admin123"

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(tapToScreen(_:)))
        view.addGestureRecognizer(tapToScreen)
        loginButton.addTarget(self, action: #selector(loginButtonTouchUpInside(_:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTouchUpInside(_:)), for: .touchUpInside)
    }

    private func initView() {
        setupTextField(textField: usernameTextField)
        setupTextField(textField: passwordTextField)
        setupButton(button: clearButton)
        setupButton(button: loginButton)

        errorLabel.isHidden = true
        passwordTextField.isSecureTextEntry = true
    }

    private func setupTextField(textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
    }

    private func setupButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
   
    private func checkLogin() -> String {
        enum errorString :String {
            case chuaNhapUsernameVaPassword = "Bạn chưa nhập dữ liệu"
            case chuaNhapUsername = "Bạn chưa điền username"
            case chuaNhapPassword = "Bạn chưa điền password"
            case nhapSaiUsernameVaPassword = "Nhập sai tên username hoặc password"
        }
        switch (usernameTextField.text, passwordTextField.text) {
        case ("",""):
            return errorString.chuaNhapUsernameVaPassword.rawValue
        case ("",_):
            return errorString.chuaNhapUsername.rawValue
        case (_, ""):
            return errorString.chuaNhapPassword.rawValue
        default:
            return errorString.nhapSaiUsernameVaPassword.rawValue
        }
    }
    
    private func login() {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if (username, password) == (validUsername, validPassword) {
                errorLabel.isHidden = true
                print("Đăng nhập thành công")
            } else {
                errorLabel.isHidden = false
                errorLabel.text = checkLogin()
                errorLabel.textColor = .red
            }
        }
    }
    
    @objc private func loginButtonTouchUpInside(_ sender: Any) {
        login()
        passwordTextField.endEditing(true)
    }

    @objc private func clearButtonTouchUpInside(_ sender: Any) {
        usernameTextField.text = nil
        passwordTextField.text = nil
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
            passwordTextField.becomeFirstResponder()
        }
        if textField.tag == 1 {
            login()
        }
    }
}



