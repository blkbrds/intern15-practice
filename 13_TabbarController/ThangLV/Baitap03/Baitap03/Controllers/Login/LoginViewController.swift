//
//  LoginViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/20/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpInsideLoginButton(_ sender: Any) {
        let tabBarController = TabBarController()
        SceneDelegate.shared.changeRootView(tabBarController)
    }
}
