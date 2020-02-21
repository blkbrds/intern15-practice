//
//  LoginViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/5/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }

    @IBAction func loginButton(_ sender: Any) {
        let tabBarController = MyTabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }

    @IBAction func registerButton(_ sender: Any) {
        let registerController = RegisterViewController()
        navigationController?.pushViewController(registerController, animated: true)
    }

    @IBAction func forgotPasswordButton(_ sender: Any) {
        let forgetPasswordVC = ForgotPasswordViewController()
        navigationController?.pushViewController(forgetPasswordVC, animated: true)
    }
}
