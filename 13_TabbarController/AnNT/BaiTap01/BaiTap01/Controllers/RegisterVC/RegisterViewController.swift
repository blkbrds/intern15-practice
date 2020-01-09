//
//  RegisterViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/5/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
    }

    @IBAction func registerButton(_ sender: Any) {
        let tabBarController = MyTabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}
