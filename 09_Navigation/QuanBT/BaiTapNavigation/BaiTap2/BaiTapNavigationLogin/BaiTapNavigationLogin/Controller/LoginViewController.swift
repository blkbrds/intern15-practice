//
//  LoginViewController.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func doneTouchUpInside(){
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
