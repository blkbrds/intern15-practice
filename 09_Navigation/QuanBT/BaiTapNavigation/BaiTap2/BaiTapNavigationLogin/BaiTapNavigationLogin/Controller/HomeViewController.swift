//
//  HomeViewController.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTouchUpInside))
        navigationItem.leftBarButtonItem = logoutButton
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }

    @objc func logoutTouchUpInside(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func editTouchUpInside(){
        let vc = EditViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
