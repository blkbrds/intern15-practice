//
//  HomeViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 12/12/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var notificationLabel: UILabel!

    let userName: String = "Admin"
    let userPassword: String = "Admin123"

    enum Error {
        case emptyFields
        case syntaxError
        case lackedInfo
    }

    @IBAction func clearButtonTouchUpInside(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }

    @IBAction func loginTouchUpInside(_ sender: Any) {
        login()
    }

    func login() {
        switch (userNameTextField.text, passWordTextField.text) {
        case (userName, userPassword):
            notificationLabel.text = "Login successfully!"
            notificationLabel.textColor = .green
        case ("", ""):
            notificationLabel.text = "Data is not entered"
            notificationLabel.textColor = .brown
        case ("", _):
            notificationLabel.text = "User name is missing"
            notificationLabel.textColor = .orange
        case (_, ""):
            notificationLabel.text = "Password is missing"
            notificationLabel.textColor = .orange
        default:
            notificationLabel.text = "Incorrect information"
            notificationLabel.textColor = .red
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.textFieldShouldReturn(userNameTextField)
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

