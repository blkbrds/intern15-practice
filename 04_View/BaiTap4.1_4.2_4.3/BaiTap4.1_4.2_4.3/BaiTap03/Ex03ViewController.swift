//
//  Ex03ViewController.swift
//  BaiTap4.1_4.2_4.3
//
//  Created by ANH NGUYỄN on 10/8/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var passworkText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    let userName: String = "hanhnguyen3"
    let passwork: String = "123123"
    enum Error: String {
        case khongNhapChu = "Không nhập"
        case nhapSai = "Nhập sai "
        case thieu = "Thiếu "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        userNameText.tag = 0
        passworkText.delegate = self
        passworkText.tag = 1
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func loginButton(_ sender: Any) {
        login()
    }
    func login () {
        switch (userNameText.text, passworkText.text) {
        case ("", ""):
            labelView.text = Error.khongNhapChu.rawValue
        case (userName, passwork):
            labelView.text = "Nhập đúng "
        case ("", ""):
            labelView.text = Error.thieu.rawValue
        default:
            labelView.text = Error.nhapSai.rawValue
        }
        view.endEditing(true)
    }
    @IBAction func clearButton(_ sender: Any) {
        userNameText.text = ""
        passworkText.text = ""
    }
}
extension Ex03ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            passworkText.becomeFirstResponder() }
        if textField.tag == 1 {
            login()
        }
    }
}
