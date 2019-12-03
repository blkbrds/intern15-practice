//
//  LoginViewController.swift
//  BaiTap13
//
//  Created by ANH NGUYỄN on 12/3/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let userName = "hanh"
    private let passWord = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func loginTouchUpInside(_ sender: Any) {
        guard let userNameLogin = userNameTextField.text, userName == userNameLogin,
              let passWordLogin = passwordTextField.text, passWord == passWordLogin else {
            return
        }
        UserDefaults.standard.set(userName, forKey: "userName")
        SceneDelegate.shared.configRootView(with: .login)
    }
}

