//
//  LoginViewController.swift
//  BaitapView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var clearBtn: UIButton!
  @IBOutlet weak var loginBtn: UIButton!
  @IBOutlet weak var noteLabel: UILabel!
  @IBOutlet weak var passWordTF: UITextField!
  @IBOutlet weak var userTF: UITextField!
  
  enum Error: String{
    case noneUserOrPass = "Thiếu username hoặc password"
    case wrongNameOrPass = "Nhap sai username hoặc password"
  }
  
  let username = "Admin"
  let password = "Admin123"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapToScreen(_:)))
    self.view.addGestureRecognizer(tapGesture)
    loginBtn.addTarget(self, action: #selector(tapLoginBtn(_:)), for: .touchUpInside)
    clearBtn.addTarget(self, action: #selector(tapClearBtn(_:)), for: .touchUpInside)
  }
  
  func setupUI() {
    setupTextField(textField: userTF)
    setupTextField(textField: passWordTF)
    self.noteLabel.isHidden = true
    setupButton(button: loginBtn)
    setupButton(button: clearBtn)
  }
  
  func setupTextField(textField: UITextField) {
    textField.layer.borderColor = UIColor.black.cgColor
    textField.layer.borderWidth = 1
    textField.clipsToBounds = true
    textField.layer.cornerRadius = 5
    textField.delegate = self
  }
  
  func setupButton(button: UIButton) {
    button.clipsToBounds = true
    button.layer.cornerRadius = 5
  }
  
  @objc func tapToScreen(_ sender: UITapGestureRecognizer) {
    self.view.endEditing(true)
  }
  
  @objc func tapLoginBtn(_ sender: UIButton) {
    login()
    passWordTF.endEditing(true)
  }
  
  func login() {
    switch (userTF.text, passWordTF.text) {
    case (username, password):
      noteLabel.isHidden = true
    case ("", _), (_, ""), ("", ""):
      self.noteLabel.text = Error.noneUserOrPass.rawValue
      noteLabel.isHidden = false
    default:
      self.noteLabel.text = Error.wrongNameOrPass.rawValue
      noteLabel.isHidden = false
    }
  }
  
  @objc func tapClearBtn(_ sender: UIButton) {
    userTF.text = nil
    passWordTF.text = nil
    noteLabel.isHidden = true
  }
  
}

extension LoginViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    if textField.tag == 0 {
      self.passWordTF.becomeFirstResponder()
    }
    if textField.tag == 1 {
      login()
    }
  }
  
}
