//
//  EditViewController.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 11/5/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class EditViewController: UIViewController {

    @IBOutlet weak var newUserNameTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!

    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    private func setupNavi() {
        title = "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editUser))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToView))
    }

    @objc private func editUser() {
        guard let user = newUserNameTextField.text, !user.isEmpty,
            let pass = newPasswordTextField.text, !pass.isEmpty,
            let confirmPass = confirmPassTextField.text, confirmPass == pass else { return }
        UserDefaults.standard.set(user, forKey: "username")
        guard let userEdit = self.user else { return }
        Ex2DataManagement.shared.writePlistToList(user: userEdit, username: user, password: pass)
        navigationController?.popViewController(animated: true)
    }
    @objc private func popToView() {
        navigationController?.popViewController(animated: true)
    }
}
