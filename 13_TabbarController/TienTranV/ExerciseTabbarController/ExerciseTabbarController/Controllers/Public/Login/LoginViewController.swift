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

    override func setupUI() {
        super.setupUI()
        title = "Login"
        
        setupUITextField(textField: userNameTextField)
        setupUITextField(textField: passWordTextField)
        setUpButton(button: clearButton)
        setUpButton(button: loginButton)
        errorLabel.isHidden = true
        passWordTextField.isSecureTextEntry = true
        loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(tapClearButton), for: .touchUpInside)
    }

    private func setupUITextField(textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
    }

    private func setUpButton(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
    }

    private func handleLogin() {
        UserDefaults.standard.set("login", forKey: "Is Login")
        SceneDelegate.shared().configRootView(with: .login)
    }

    @objc private func tapLoginButton() {
        handleLogin()
    }

    @objc private func tapClearButton() {
        userNameTextField.text = nil
        passWordTextField.text = nil
        errorLabel.isHidden = true
    }
    
    @IBAction private func signUpTouchUpInside(_ sender: Any) {
        let signUpVC = RegisterViewController()
        pushViewController(viewcontroller: signUpVC)
    }
    
    @IBAction private func forgotPasswordTouchUpInside(_ sender: Any) {
        let forgotPassword = ForgotPasswordViewController()
        pushViewController(viewcontroller: forgotPassword)
    }
}
