//
//  RegisterViewController.swift
//  TabbarController
//
//  Created by PCI0019 on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var notificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        notificationLabel.textColor = .red
    }

    @IBAction func reginsterButtonTouchUpInside(_ sender: Any) {
        switch (usernameTextField.text, confirmPasswordTextField.text) {
        case ("",""):
            notificationLabel.text = "Chưa nhập username và password"
        case ("", _):
            notificationLabel.text = "Chưa nhập username"
        case (_, ""):
            notificationLabel.text = "Chưa nhập password"
        default:
           if newPasswordTextField.text == confirmPasswordTextField.text {
               SceneDelegate.shared.changeRoot(root: .tabbar)
           } else {
               notificationLabel.text = "Password và confirm password không trùng khớp"
           }
        }
    }
}
