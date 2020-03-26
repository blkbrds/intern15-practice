//
//  LoginViewController.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var reportLabel: UILabel!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reportLabel.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Login"
        usernameTextField.delegate = self
        usernameTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func doneTouchUpInside(){
        login()
    }
    
    private func login() {
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
        DataUser.share.testuser = usernameTextField.text!
        DataUser.share.testpass = passwordTextField.text!
        if DataUser.share.test() == 0 {
            reportLabel.text = "Bạn nhập sai username hoặc password"
        } else {
            let username = usernameTextField.text
            let vcHome = HomeViewController()
            vcHome.username = username!
            self.navigationController?.pushViewController(vcHome, animated: true)
        }
    }
}

// MARK: - Extension
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder() }
        if textField.tag == 1 {
            test()
        }
    }
}
