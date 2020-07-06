//
//  LoginNavigationViewController.swift
//  TabbarController
//
//  Created by PCI0019 on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class LoginNavigationViewController: UIViewController {

    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var name: String = "Admin"
    var password: String = "123"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        notificationLabel.text = "Bạn đã nhập sai"
        notificationLabel.isHidden = true 
    }
   
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        if usernameTextField.text == name || passwordTextField.text == password {
            SceneDelegate.shared.changeRoot(root: .tabbar)
        } else {
            notificationLabel.textColor = .red
            notificationLabel.isHidden = false
        }
    }
    
    @IBAction func registerButtonTouchUpInside(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
