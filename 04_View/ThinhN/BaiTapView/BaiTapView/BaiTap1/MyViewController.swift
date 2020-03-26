//
//  MyViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/18/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override private func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
        userName.text = "Name"
        userName.textAlignment = .center
        userName.backgroundColor = .systemBlue
        userName.textColor = .white
        view.addSubview(userName)
    }
}
