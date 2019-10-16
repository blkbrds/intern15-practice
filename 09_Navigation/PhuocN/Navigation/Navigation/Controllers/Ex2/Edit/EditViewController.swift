//
//  EditViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {
    
    @IBOutlet private weak var confirmPassTextField: UITextField!
    @IBOutlet private weak var newPassTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    
    func setupNavi() {
        title = "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editUser))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToView))
    }
    
    @objc func editUser() {
        guard let user = userNameTextField.text, user != "",
            let pass = newPassTextField.text, pass != "",
            let confirmPass = confirmPassTextField.text, confirmPass == pass else { return }
        UserDefaults.standard.set(user, forKey: "username")
        guard let userEdit = self.user else { return }
        DataManagement.share.writePlistToList(user: userEdit, username: user, password: pass)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func popToView() {
        navigationController?.popViewController(animated: true)
    }
}
