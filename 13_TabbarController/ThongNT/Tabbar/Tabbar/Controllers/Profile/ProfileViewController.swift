//
//  ProfileViewController.swift
//  Tabbar
//
//  Created by PCI0018 on 11/20/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        title = "Profile"
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    @objc private func logout() {
        // handle later
    }
    
}
