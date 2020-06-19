//
//  LoginViewController.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var dataUser: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        setupBarButton()
        let tap = UITapGestureRecognizer(target: self, action: #selector(hiddenKeyBoard))
        view.addGestureRecognizer(tap)
        checkData()
        usernameTextField.delegate = self
        usernameTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        
    }
    
    @objc func hiddenKeyBoard() {
        view.endEditing(true)
    }
    func setupBarButton () {
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(pushToHomeView))
        navigationItem.rightBarButtonItem = doneButton
    }
    @objc func pushToHomeView() {
        for item in dataUser {
            if usernameTextField.text == item.username && passwordTextField.text == item.password  {
                let vc = HomeViewController()
                vc.name = item.username
                vc.delegate = self 
                navigationController?.pushViewController(vc, animated: true)
            } 
        }
    }

    func checkData() {
        guard let path = Bundle.main.url(forResource: "DataUser", withExtension: "plist") else { return }
        guard let contactData = NSArray(contentsOf: path) as? [[String: String]] else { return }
        for item in contactData {
            guard let username = item["username"], let password = item["password"] else { return }
            let user = User(username: username, password: password)
            dataUser.append(user)
        }
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
extension LoginViewController: HomeViewControllerDelegate {
    func clearTextFieldOfLoginView() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}
