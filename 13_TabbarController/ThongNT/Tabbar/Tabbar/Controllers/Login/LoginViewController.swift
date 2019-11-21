//
//  LoginViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    private var user: (name: String, password: String) = ("thong", "thong")

    enum Error: String {
        case khongNhapChu = "Bạn chưa nhập gì cả"
        case nhapSai = "Bạn nhập sai rồi"
        case thieu = "Bạn nhập thiếu rồi"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }

    override func setupUI() {
        super.setupUI()
        title = "Login"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
        navigationItem.rightBarButtonItems = [doneButton]
    }

    @objc private func clickDone() {
        guard let newPassword = UserDefaults.standard.value(forKey: "newPassword") as? String else { return }
        user.password = newPassword
        switch (userNameTextField.text, passwordTextField.text) {
        case ("", ""):
            createAlert(title: "WARNING", message: Error.khongNhapChu.rawValue)
        case ("", _), (_, ""):
            createAlert(title: "WARNING", message: Error.thieu.rawValue)
        case (_, _):
            if let username = userNameTextField.text, let password = passwordTextField.text {
                if user.name == username, user.password == password {
                    UserDefaults.standard.set(true, forKey: "LoginStatus")
                    SceneDelegate.shared.didLogin()
                }
            }
            createAlert(title: "WARNING", message: Error.nhapSai.rawValue)
        }
        view.endEditing(true)
    }

    private func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder() }
        if textField.tag == 1 {
            clickDone()
        }
        return true
    }
}
