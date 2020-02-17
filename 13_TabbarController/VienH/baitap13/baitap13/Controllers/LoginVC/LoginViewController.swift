//
//  LoginViewController.swift
//  baitap13
//
//  Created by user on 1/20/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func setupUI() {
        super.setupUI()
        self.title = "Login"
        updateView()
    }

    override func setupData() {
    }

    func updateView() {
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }

    // MARK: - Actions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {

        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                print("Đăng nhập thành công")
                self.updateView()
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
            case .failure(let isError, let errorMsg):
                if isError {
                    print("Đăng nhập thất bại")
                    print(errorMsg)
                }
            }
        }
        viewModel.login(email: email, password: password, completion: complete)
    }

    @IBAction private func registerButtonTouchUpInside(_ sender: Any) {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func forgotPasswordButtonTouchUpInside(_ sender: Any) {
        let vc = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == self.emailTextField) {
            self.passwordTextField.becomeFirstResponder()
        } else if (textField == self.passwordTextField) {
            print("Login")
        }
        return true
    }
}
