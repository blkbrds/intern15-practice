//
//  RegisterViewController.swift
//  TabbarController
//
//  Created by Sếp Quân on 4/7/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "register"
    }
    
    // MARK: - IBAction
    @IBAction func registerTouchUpInside(_ sender: Any) {
        if confirmPasswordTextField.text == passwordTextField.text {
             SceneDelegate.shared.changtabBarController()
        }
    }
}
