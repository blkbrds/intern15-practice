//
//  LoginViewController.swift
//  baitapMVVM
//
//  Created by user on 1/21/20.
//  Copyright © 2020 VienH. All rights reserved.
//

import UIKit

final class LoginViewController: BaseViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - config
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
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {

        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        // tao gia tri cho closure
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                //làm cái gi đó
                print("ĐĂNG NHẬP THÀNH CÔNG")
                self.updateView()

                //thay đổi root
                let scene = UIApplication.shared.connectedScenes.first
                if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
            case .failure(let isError, let errorMsg):
                if isError {
                    print("ĐĂNG NHẬP THẤT BẠI")
                    print(errorMsg)
                }
            }
        }

        // goi ham
        viewModel.login(email: email, password: password, completion: complete)
    }

    @IBAction func registerButtonTouchUpInside(_ sender: Any) {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func forgotPasswordButtonTouchUpInside(_ sender: Any) {
        let vc = ForgotPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Touch View
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


