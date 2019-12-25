//
//  LoginVC.swift
//  BaiTap03
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    let userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.placeholder = "username"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        textField.leftViewMode = .always
        textField.borderWith(color: .gray, cornerRadius: 20, borderWidth: 2)
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.returnKeyType = UIReturnKeyType.done
        textField.isSecureTextEntry = true
        textField.placeholder = "password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        textField.leftViewMode = .always
        textField.borderWith(color: .gray, cornerRadius: 20, borderWidth: 2)
        return textField
    }()

    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textColor = .red
        return label
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let loginTitleAttribute = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(loginTitleAttribute, for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.gray, for: .highlighted)
        button.borderWith(color: .gray, cornerRadius: 10, borderWidth: 1)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()

    let clearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        let clearTitleAttribute = NSAttributedString(string: "Clear", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(clearTitleAttribute, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.borderWith(color: .gray, cornerRadius: 10, borderWidth: 1)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        userTextField.delegate = self
        passwordTextField.delegate = self
        setupUI()
    }

    func setupUI() {
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(errorLabel)
        view.addSubview(loginButton)
        view.addSubview(clearButton)
        NSLayoutConstraint.activate([
            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTextField.heightAnchor.constraint(equalToConstant: 45),
            userTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            userTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),

            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            errorLabel.heightAnchor.constraint(equalToConstant: 40),

            loginButton.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 30),

            clearButton.rightAnchor.constraint(equalTo: userTextField.rightAnchor),
            clearButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
            clearButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            clearButton.topAnchor.constraint(equalTo: loginButton.topAnchor),
            ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if passwordTextField.isEditing {
            self.passwordTextField.endEditing(true)
        } else {
            passwordTextField.becomeFirstResponder()
        }
        return false
    }

    @objc func handleLogin(_ sender: UIButton) {
        guard userTextField.text != "", passwordTextField.text != "" else {
            showError(titleError: "Không để trống username, password")
            return
        }
        guard userTextField.text != "" else {
            showError(titleError: "Không để trống username")
            return
        }
        guard passwordTextField.text != "" else {
            showError(titleError: "Không để trống password")
            return
        }
        if let username = userTextField.text, let password = passwordTextField.text, username == "Admin", password == "Admin123" {
            hindddenError()
        }else {
            showError(titleError: "Nhập sai username và password")
        }
    }

    @objc func handleClear(_ sender: UIButton) {
        userTextField.text = ""
        passwordTextField.text = ""
    }

    func showError(titleError: String) {
        errorLabel.isHidden = false
        errorLabel.text = titleError
    }

    func hindddenError() {
        errorLabel.isHidden = true
    }
}


extension UIView {
    func borderWith(color: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
    }
}

extension UIReturnKeyType {
    var label: String {
        switch self {
        case .next:
            return "Next"
        case .default:
            return "Return"
        case .go:
            return "Go"
        case .done:
            return "Done"
        default:
            return "Enter"
        }
    }
}
