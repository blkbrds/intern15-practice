//
//  ViewController.swift
//  BaiTap03
//
//  Created by PCI0002 on 11/12/19.
//  Copyright © 2019 PCI0002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    let username = "Admin"
    let admin = "Admin123"

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

    func initView() {
        setUpUITextField(textField: userNameTextField)
        setUpUITextField(textField: passWordTextField)
        setUpButton(button: clearButton)
        setUpButton(button: loginButton)

        errorLabel.isHidden = true
        passWordTextField.isSecureTextEntry = true
    }

    func setUpUITextField(textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
    }

    func setUpButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
    }

    func exception(stringData: (String, String)) -> String {
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

    func login() {
        let stringData: (String, String) = (self.userNameTextField.text ?? "", self.passWordTextField.text ?? "")

        if stringData == (username, admin) {
            errorLabel.isHidden = true
            print("Đăng nhập thành công")
        } else {
            errorLabel.isHidden = false
            errorLabel.text = exception(stringData: stringData)
            errorLabel.textColor = .red
        }
    }

    @objc func tapLoginButton(_ sender: Any) {
        login()
        passWordTextField.endEditing(true)
    }

    @objc func tapClearButton(_ sender: Any) {
        userNameTextField.text = nil
        passWordTextField.text = nil
        errorLabel.isHidden = true
    }

    @objc func tapToScreen(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

}

extension ViewController: UITextFieldDelegate {

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
            print("login")
        }
    }
}
