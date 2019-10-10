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
        let userAvatarImageView = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        view.addSubview(userAvatarImageView)

        // add user name
        let userNameLabel = UILabel(frame: CGRect(x: 30, y: 150, width: 100, height: 40))
        userNameLabel.text = "NAME"
        userNameLabel.backgroundColor = .white
        userNameLabel.textColor = .black
        userNameLabel.textAlignment = .center
        view.addSubview(userNameLabel)
    }
}
