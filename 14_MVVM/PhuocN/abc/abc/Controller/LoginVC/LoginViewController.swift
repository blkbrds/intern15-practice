//
//  LoginViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/22/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet private weak var passWordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func loginTouchUpInside(_ sender: Any) {
        guard let userNameLogin = userNameTextField.text, let passWordLogin = passWordTextField.text else { return }
        viewModel.login(username: userNameLogin, password: passWordLogin) { (done) in
            if done == true {
                UserDefaults.standard.set(userNameLogin, forKey: "username")
                SceneDelegate.shared.configRootView(status: .login)
            } else {
                print("Not have this user")
            }
        }
    }
}
