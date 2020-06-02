//
//  ProfileViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 6/1/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit
protocol ProfileViewControllerDelegate: class {
    func logout(view: ProfileViewController)
}

class ProfileViewController: UIViewController {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.logout(view: self)
        }
    }
}
