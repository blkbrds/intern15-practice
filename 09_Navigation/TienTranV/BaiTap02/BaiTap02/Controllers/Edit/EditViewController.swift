//
//  EditViewController.swift
//  BaiTap02
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class EditViewController: BaseViewController {

    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var userNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func setupUI() {
        super.setupUI()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDone))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let userName = UserDefaults.standard.string(forKey: "userName"), let password = UserDefaults.standard.string(forKey: "password") else { return }
        userNameTextField.text = userName
        passwordTextField.text = password
    }

    @objc private func tapCancel() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func tapDone() {
        guard let userName = userNameTextField.text,
            !userName.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty,
            let confirmPass = confirmPasswordTextField.text,
            confirmPass == password else {
                return
        }
        guard let viewcontrollers = navigationController?.viewControllers else { return }
        for viewcontroller in viewcontrollers where viewcontroller is HomeViewController {
            guard let vc = viewcontroller as? HomeViewController else { break }
            UserDefaults.standard.set(userName, forKey: "userName")
            UserDefaults.standard.set(password, forKey: "password")
            navigationController?.popToViewController(vc, animated: true)
        }
    }
}
