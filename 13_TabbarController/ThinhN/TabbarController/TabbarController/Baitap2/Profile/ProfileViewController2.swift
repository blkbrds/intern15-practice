//
//  ProfileViewController2.swift
//  TabbarController
//
//  Created by PCI0019 on 7/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ProfileViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTouchUpInside))
        navigationItem.rightBarButtonItem = logoutButton
    }
    @objc func logoutButtonTouchUpInside() {
        SceneDelegate.shared.changeRoot(root: .login)
    }
}
