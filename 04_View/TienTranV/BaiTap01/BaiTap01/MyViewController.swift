//
//  MyViewController.swift
//  BaiTap01
//
//  Created by PCI0002 on 11/12/19.
//  Copyright © 2019 PCI0002. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add user avatar
        let userAvatar = UIImageView(frame: CGRect(origin: CGPoint(x: 10, y: 100), size: CGSize(width: 100, height: 150)))
        userAvatar.image = UIImage(named: "girl")
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)


        // Add user name
        let userName = UILabel(frame: CGRect(x: 10, y: 250, width: 100, height: 25))
        userName.text = "Girl"
        userName.textAlignment = .center
        userName.backgroundColor = .green
        view.addSubview(userName)
    }
}
