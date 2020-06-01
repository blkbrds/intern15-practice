//
//  LoginViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 6/1/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit
protocol LoginViewControllerDelegate: class {
    func login(view: LoginViewController)
}
class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var notificationLabel: UILabel!
    
    var userName: String = "QuanAP"
    var passWord: String = "123456"
    weak var delegate: LoginViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    private func setupButton() {
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
    }
    
    @IBAction func loginButtonTouchUpInSide(_ sender: Any) {
        if userNameTextField.text == userName && passWordTextField.text == passWord {
            if let delegate = delegate {
                delegate.login(view: self)
            }
        } else {
            notificationLabel.isHidden = false
        }
    }
    @IBAction func registerButtonTouchUpInSide(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
