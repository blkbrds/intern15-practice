//
//  ProfileViewController.swift
//  ExerciseTabbarController
//
//  Created by PCI0002 on 12/11/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ProfileViewController: BaseViewController {
    
    override func setupUI() {
        super.setupUI()
        title = "Profile"
    }
    
    @IBAction private func pushViewController(_ sender: Any) {
        pushViewController(viewcontroller: ViewController())
    }
    
    @IBAction private func logoutTouchUpInside(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "Is Login")
        SceneDelegate.shared().configRootView(with: .logout)
    }
}
