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
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var reportLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "register"
    }
    
    // MARK: - IBAction
    @IBAction func registerButtonTouchUpInside(_ sender: Any) {
        switch (usernameTextField.text, passwordTextField.text) {
        case ("", ""):
            reportLabel.text = "Bạn chưa nhập username và password"
        case ("", _):
            reportLabel.text = "Bạn chưa nhập username"
        case (_, ""):
            reportLabel.text = "Bạn chưa nhập password"
        case (_, _):
            testPassword()
        }
        view.endEditing(true)
    }
    
    private func testPassword() {
        if confirmPasswordTextField.text != passwordTextField.text {
            reportLabel.text = "Bạn nhập sai password và confirm password"
        } else {
            SceneDelegate.shared.changeRootViewController()
        }
    }
}
