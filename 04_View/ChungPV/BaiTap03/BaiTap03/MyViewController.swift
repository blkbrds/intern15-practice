//
//  MyViewController.swift
//  BaiTap03
//
//  Created by MBA0168 on 6/7/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

final class MyViewController: UIViewController, UITextFieldDelegate {
    
    let userName: String = "Admin"
    let password: String = "Admin123"
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Place holder
        userNameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        
        // Secure password
        passwordTextField.isSecureTextEntry = true
        
        // xu ly ban phim
        userNameTextField.delegate = self
        userNameTextField.tag = 0
        userNameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        
        passwordTextField.returnKeyType = UIReturnKeyType.done
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField.returnKeyType == UIReturnKeyType.done {
            if userNameTextField.text == "" && passwordTextField.text == ""{
                errorLabel.text = "Please input username and password."
            } else if userNameTextField.text == "" {
                errorLabel.text = "Please input username."
            } else if passwordTextField.text == "" {
                errorLabel.text = "Please input password."
            } else if userNameTextField.text != userName || passwordTextField.text != password {
                errorLabel.text = "Invalid username or password."
            } else {
                errorLabel.isHidden = true
            }
        }

        return false
    }
    @IBAction func loginButton(_ sender: Any) {
        if userNameTextField.text == "" && passwordTextField.text == ""{
            errorLabel.text = "Please input username and password."
        } else if userNameTextField.text == "" {
            errorLabel.text = "Please input username."
        } else if passwordTextField.text == "" {
            errorLabel.text = "Please input password."
        } else if userNameTextField.text != userName || passwordTextField.text != password {
            errorLabel.text = "Invalid username or password."
        } else {
            errorLabel.isHidden = true
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

}
