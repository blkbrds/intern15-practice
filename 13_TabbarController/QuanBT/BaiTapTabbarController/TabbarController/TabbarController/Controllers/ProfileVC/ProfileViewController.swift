//
//  ProfileViewController.swift
//  TabbarController
//
//  Created by Sếp Quân on 4/7/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    @objc func logout() {
        SceneDelegate.shared.changLoginVC()
    }
}
