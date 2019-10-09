//
//  LoginViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passWordText: UITextField!
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    let userName: String = "admin"
    let passWord: String = "admin123"

    enum Error: String {
        case khongNhapChu = "Bạn chưa nhập gì cả"
        case nhapSai = "Bạn nhập sai rồi"
        case thieu = "Bạn nhập thiếu rồi"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        userNameText.tag = 0
        passWordText.delegate = self
        passWordText.tag = 1
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func loginButton(_ sender: Any) {
        login()
    }

    func login () {
        switch (userNameText.text, passWordText.text) {
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

    @IBAction func clearButton(_ sender: Any) {
        userNameText.text = ""
        passWordText.text = ""
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
            passWordText.becomeFirstResponder() }
        if textField.tag == 1 {
            login()
        }

    }
}
