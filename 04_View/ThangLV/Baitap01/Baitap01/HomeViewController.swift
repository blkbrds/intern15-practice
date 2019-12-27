//
//  HomeViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 12/9/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add user avatar
        let frame: CGRect = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatarImageView = UIImageView(image: UIImage(named: "No Avatar.jpg"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        view.addSubview(userAvatarImageView)
        
        //Add user name
        let userNameLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userNameLabel.text = "User name"
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textColor = .blue
        view.addSubview(userNameLabel)
        
        //Add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        view.addSubview(button)
}
     
    @objc func clickButton() {
        print("Button is clicked!")
    }
}
