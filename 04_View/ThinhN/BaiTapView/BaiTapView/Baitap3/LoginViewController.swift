//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/19/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//
import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!

    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!

    private let username = "Admin"
    private let pass = "Admin123"

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(tapToScreen(_:)))
        view.addGestureRecognizer(tapToScreen)
        loginButton.addTarget(self, action: #selector(tapLoginButton(_:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(tapClearButton(_:)), for: .touchUpInside)
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
   
    private func checkLogin(stringData: (String, String)) -> String {
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
        if let username = usernameTextField.text, let password = passwordTextField.text {
        let stringData: (String, String) = (username, password)
        if stringData == (username, pass) {
            errorLabel.isHidden = true
            print("Đăng nhập thành công")
                 } else {
                     errorLabel.isHidden = false
                     errorLabel.text = checkLogin(stringData: stringData)
                     errorLabel.textColor = .red
                 }
           }
       }
    
    @objc private func tapLoginButton(_ sender: Any) {
        login()
        passwordTextField.endEditing(true)
    }

    @objc private func tapClearButton(_ sender: Any) {
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



