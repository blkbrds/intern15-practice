//
//  ProfileViewController.swift
//  Tabbar
//
//  Created by PCI0018 on 11/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func setupUI() {
        title = "Profile"

        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(goToEditVC))
        navigationItem.leftBarButtonItem = editButton
    }

    @objc private func logout() {
        UserDefaults.standard.set(nil, forKey: "LoginStatus")
        SceneDelegate.shared.willLogin()
    }

    @objc private func goToEditVC() {
        navigationController?.pushViewController(EditViewController(), animated: true)
    }
}
