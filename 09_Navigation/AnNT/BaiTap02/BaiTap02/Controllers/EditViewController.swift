//
//  EditViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
  func passByUser(user: User)
}

class EditViewController: BaseViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var confirmPasswordTextField: UITextField!
  
  weak var delegate: EditViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func setupNavigationBar() {
    super.setupNavigationBar()
    title = "Edit"
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleDone))
  }
  
  @objc func handleCancel(){
    navigationController?.popViewController(animated: true)
  }
  
  @objc func handleDone(){
    guard let username = usernameTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else {
      return
    }
    if password != confirmPassword {
      print("Password not same!")
      return
    }
    let user = User(username: username, password: password)
    let userN = UserDefaults.standard.value(forKey: "username") as? String
    for i in 0..<UserData.users.count {
      if userN == UserData.users[i].username {
        UserData.users[i] = user
        break
      }
    }
    try? UserData.saveData()
    delegate?.passByUser(user: user)
    navigationController?.popViewController(animated: true)
  }
}
