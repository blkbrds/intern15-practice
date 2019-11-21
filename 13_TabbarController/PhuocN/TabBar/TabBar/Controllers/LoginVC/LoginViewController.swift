//
//  LoginViewController.swift
//  TabBar
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {

    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    private let userName = "abc"
    private let passWord = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupNavi() {
        title = "Login"
    }
    
    @IBAction private func loginTouchUpInside(_ sender: Any) {
        guard let userNameLogin = userNameTextField.text, userName == userNameLogin,
              let passWordLogin = passWordTextField.text, passWord == passWordLogin else {
            return
        }
        UserDefaults.standard.set(userName, forKey: "userName")
        SceneDelegate.shared.configRootView(with: .login)
    }
}
