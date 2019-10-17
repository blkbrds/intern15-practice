//
//  LoginViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passWordTextField: UITextField!
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = []
        fetchData()
        userNameTextField.text = ""
        passWordTextField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func fetchData() {
        DataManagement.share.preparePlistForObject(forResource: "users", ofType: "plist", withURL: "/users.plist")
        users = DataManagement.share.getUser(fileName: "users", type: "plist")
        print(users)
    }
    
    private func setupNavi() {
        title = "Login"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(login))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func login () {
        guard  let username = userNameTextField.text, username != "",
            let password = passWordTextField.text, password != "" else { return }
        UserDefaults.standard.set(username, forKey: "username")
        for user in users where user.userName == username && user.password == password {
            let vc = WellcomeViewController()
            vc.user = user
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        print("Login fail")
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
