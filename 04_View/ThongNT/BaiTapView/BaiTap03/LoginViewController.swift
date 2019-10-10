//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    let userName: String = "admin"
    let passWord: String = "admin123"

    enum Error: String {
        case khongNhapChu = "Bạn chưa nhập gì cả"
        case nhapSai = "Bạn nhập sai rồi"
        case thieu = "Bạn nhập thiếu rồi"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        userNameTextField.tag = 0
        passWordTextField.delegate = self
        passWordTextField.tag = 1
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func login () {
        switch (userNameTextField.text, passWordTextField.text) {
        case ("", ""):
            informLabel.text = Error.khongNhapChu.rawValue
        case (userName, passWord):
            informLabel.text = "Chúc mừng bạn đã đăng nhập thành công"
        case ("", _), (_, ""):
            informLabel.text = Error.thieu.rawValue
        default:
            informLabel.text = Error.nhapSai.rawValue
        }
        view.endEditing(true)
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        login()
    }

    @IBAction func tapClearButton(_ sender: Any) {
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    //ban phim di xuong
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passWordTextField.becomeFirstResponder() }
        if textField.tag == 1 {
            login()
        }
    }
}
