//
//  LoginViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    private let userName: String = "abc"
    private let passWord: String = "123"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func handleLogin(_ sender: Any) {
        guard let userNameLogin = userNameTextField.text, userName == userNameLogin,
              let passWordLogin = passWordTextField.text, passWord == passWordLogin else {
            return
        }
        UserDefaults.standard.set(userName, forKey: "username")
        SceneDelegate.shared.configRootView(status: .login)
    }
}
