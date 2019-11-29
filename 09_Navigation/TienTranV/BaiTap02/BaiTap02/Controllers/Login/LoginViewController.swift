//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!

    @IBOutlet private weak var clearButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!

    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()

        passWordTextField.delegate = self
        userNameTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
    override func setupData() {
        users = DataManagement.share.getUsers(fileName: "Users", type: "plist")
    }

    override func setupUI() {
        super.setupUI()
        title = "Login"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tapLoginButton(_:)))

        setUpUITextField(textField: userNameTextField)
        setUpUITextField(textField: passWordTextField)
        setUpButton(button: clearButton)
        setUpButton(button: loginButton)
        errorLabel.isHidden = true
        passWordTextField.isSecureTextEntry = true

        let tapToScreen = UITapGestureRecognizer(target: self, action: #selector(tapToScreen(_:)))
        view.addGestureRecognizer(tapToScreen)
        loginButton.addTarget(self, action: #selector(tapLoginButton(_:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(tapClearButton(_:)), for: .touchUpInside)
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

    private func login() {
        if let userName = userNameTextField.text, let password = passWordTextField.text {
            let user = User(userName: userName, password: password)
            for object in users where object.password == user.password && object.userName == user.userName {
                UserDefaults.standard.set(object.userName, forKey: "userName")
                UserDefaults.standard.set(object.password, forKey: "password")
                errorLabel.isHidden = true
                let homeVC = HomeViewController()
                navigationController?.pushViewController(homeVC, animated: true)
                return
            }
            print("Đăng nhập thất bại!")
            errorLabel.isHidden = false
            errorLabel.text = exception(stringData: (user.userName, user.password))
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
            passWordTextField.becomeFirstResponder()
        }
    }
}

extension LoginViewController {
    private func exception(stringData: (String, String)) -> String {
        var errorString = ""

        switch stringData {
        case ("", ""):
            errorString = "Please fill username and password"
        case ("", _):
            errorString = "Please fill username"
        case (_, ""):
            errorString = "Please fill password"
        default:
            errorString = "Error username or password"
        }
        return errorString
    }

}
