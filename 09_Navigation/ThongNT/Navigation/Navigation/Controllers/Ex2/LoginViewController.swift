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

    private var users: [User] = []

    enum Error: String {
        case khongNhapChu = "Bạn chưa nhập gì cả"
        case nhapSai = "Bạn nhập sai rồi"
        case thieu = "Bạn nhập thiếu rồi"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        title = "Login"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickDone))
        navigationItem.rightBarButtonItems = [doneButton]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = []
        fetchData()
    }

    private func fetchData() {
        DataManagement.share.preparePlistForObject(forResource: "users", ofType: "plist", withURL: "/Users.plist")
        users = DataManagement.share.getUser(fileName: "Users", type: "plist")
        print(users)
    }

    @objc private func clickDone() {
        switch (userNameTextField.text, passwordTextField.text) {
        case ("", ""):
            createAlert(title: "WARNING", message: Error.khongNhapChu.rawValue)
        case ("", _), (_, ""):
            createAlert(title: "WARNING", message: Error.thieu.rawValue)
        case (_, _):
            if let username = userNameTextField.text, let password = passwordTextField.text {
                UserDefaults.standard.set(username, forKey: "usernamePresent")
                for user in users where user.username == username && user.password == password {
                    navigationController?.pushViewController(SecondHomeViewController(), animated: true)
                    userNameTextField.text = ""
                    passwordTextField.text = ""
                    return
                }
            }
            createAlert(title: "WARNING", message: Error.nhapSai.rawValue)
        }
        view.endEditing(true)
    }

    private func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //create button OK
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder()
        }
        if textField.tag == 1 {
            clickDone()
        }
        return true
    }
}
