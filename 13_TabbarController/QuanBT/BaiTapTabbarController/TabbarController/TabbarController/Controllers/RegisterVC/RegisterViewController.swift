//
//  RegisterViewController.swift
//  TabbarController
//
//  Created by Sếp Quân on 4/7/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class RegisterViewController: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reportLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "register"
    }
    
    // MARK: - IBAction
    @IBAction func registerTouchUpInside(_ sender: Any) {
        register()  
    }
    
    private func register() {
        switch (usernameTextField.text, passwordTextField.text) {
        case ("", ""):
            reportLabel.text = "Bạn chưa nhập username và password"
        case ("", _):
            reportLabel.text = "Bạn chưa nhập username"
        case (_, ""):
            reportLabel.text = "Bạn chưa nhập password"
        case (_, _):
            test()
        }
        view.endEditing(true)
    }
    
    private func test() {
        if confirmPasswordTextField.text != passwordTextField.text {
            reportLabel.text = "Bạn nhập sai password và confirm password"
        } else {
           SceneDelegate.shared.changRootViewController()
        }
    }
}
