//
//  LoginViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupUI() {
    usernameTextField.text =  UserDefaults.standard.value(forKey: "username") as? String
    passwordTextField.text =  UserDefaults.standard.value(forKey: "password") as? String
  }

  override func setupData() {
    UserData.readFilePlist()
  }

  override func setupNavigationBar() {
    super.setupNavigationBar()
    self.title = "Login"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDone))
  }

  @objc func handleDone() {
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
      return
    }
    for user in UserData.users {
      if user.username == username && user.password == password {
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        let homeVC = HomeViewController()
        homeVC.user = user
        homeVC.delegate = self
        navigationController?.pushViewController(homeVC, animated: true)
      }
    }
  }
}

extension LoginViewController: HomeViewControllerDelegate {
  func logoutDelegate() {
    self.usernameTextField.text = ""
    self.passwordTextField.text = ""
  }
}
