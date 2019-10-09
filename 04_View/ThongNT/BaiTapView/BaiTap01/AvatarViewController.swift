//
//  AvatarViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // add user avatar
        let frame = CGRect(x: 30, y: 50, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)

        // add user name
        let userName = UILabel(frame: CGRect(x: 30, y: 150, width: 100, height: 40))
        userName.text = "NAME"
        userName.backgroundColor = .white
        userName.textColor = .black
        userName.textAlignment = .center
        view.addSubview(userName)
    }
}
