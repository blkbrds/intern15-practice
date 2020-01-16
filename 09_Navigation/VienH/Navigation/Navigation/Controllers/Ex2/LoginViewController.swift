//
//  LoginViewController.swift
//  Navigation
//
//  Created by user on 12/11/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var userNameTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextfield.text = ""
        passwordTextfield.text = ""
    }

    @IBAction private func loginButton(_ sender: Any) {
        if userNameTextfield.text == "ios15" && passwordTextfield.text == "123" {
            let vc = HelloViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
