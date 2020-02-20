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
        updateView()
        title = "Login"
    }

    func updateView() {
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }

    // MARK: - Actions
    @IBAction private func loginButtonTouchUpInside(_ sender: Any) {

        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let completion: LoginViewModel.Completion = { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                print("Đăng nhập thành công")
                this.updateView()
                let scene = UIApplication.shared.connectedScenes.first
                if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sceneDelegate.changeScreen(type: .tabbar)
                }
            case .failure(let isError, let errorMsg):
                if isError {
                    print("Đăng nhập thất bại")
                    print(errorMsg)
                }
            }
        }
        viewModel.login(email: email, password: password, completion: completion)
    }

    @IBAction private func registerButtonTouchUpInside(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func forgotPasswordButtonTouchUpInside(_ sender: Any) {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == self.emailTextField) {
            passwordTextField.becomeFirstResponder()
        } else if (textField == passwordTextField) {
            print("Login")
        }
        return true
    }
}
