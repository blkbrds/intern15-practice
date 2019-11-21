//
//  SettingViewController.swift
//  TabBar
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupNavi() {
        title = "Setting"
    }
    @IBAction private func logOut(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "userName")
        SceneDelegate.shared.configRootView(with: .logOut)
    }
}
