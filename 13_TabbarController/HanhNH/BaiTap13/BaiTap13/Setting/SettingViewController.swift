//
//  SettingViewController.swift
//  BaiTap13
//
//  Created by ANH NGUYỄN on 12/3/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func setupNavi() {
        title = "Setting"
    }

    @IBAction func logOutClick(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "userName")
        SceneDelegate.shared.configRootView(with: .logOut)
    }
}
