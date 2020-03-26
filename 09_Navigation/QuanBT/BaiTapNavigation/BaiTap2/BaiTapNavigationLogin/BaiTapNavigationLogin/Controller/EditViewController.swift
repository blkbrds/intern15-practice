//
//  EditViewController.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var confirmpassTextField: UITextField!
    @IBOutlet weak var newpassTextField: UITextField!
    @IBOutlet weak var reportLabel: UILabel!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Function
    private func setupView() {
        title = "Edit"
        usernameTextField.delegate = self
        usernameTextField.tag = 0
        newpassTextField.delegate = self
        newpassTextField.tag = 1
        confirmpassTextField.delegate = self
        confirmpassTextField.tag = 2
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTouchUpInside))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func cancelTouchUpInside(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func doneTouchUpInside(){
        edit()
    }
    
    private func edit() {
        switch (usernameTextField.text, newpassTextField.text, confirmpassTextField.text) {
        case ("", "", ""):
            reportLabel.text = "Bạn chưa nhập username và password"
        case ("", _, _):
            reportLabel.text = "Bạn chưa nhập username"
        case (_, "", ""):
            reportLabel.text = "Bạn chưa nhập password"
        case (_, _, _):
            test()
        }
        view.endEditing(true)
    }
    
    private func test() {
        if newpassTextField.text == confirmpassTextField.text {
            DataUser.share.username[DataUser.share.result] = usernameTextField.text!
            DataUser.share.password[DataUser.share.result] = newpassTextField.text!
            let username = usernameTextField.text
            let vcHome = self.navigationController?.viewControllers[1] as! HomeViewController
            vcHome.username = username!
            self.navigationController?.popToViewController(vcHome, animated: true)
        } else {
            reportLabel.text = "Bạn nhập sai confirm password"
        }
    }
}

// MARK: - Extension
extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            newpassTextField.becomeFirstResponder() }
        if textField.tag == 1 {
            confirmpassTextField.becomeFirstResponder()
        }
        if textField.tag == 2 {
            test()
        }
    }
}
