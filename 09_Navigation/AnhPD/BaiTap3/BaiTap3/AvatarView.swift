//
//  AvatarView.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/6/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate {
    func tap(userName: String, imageView: String, index: Int)
}

class AvatarView: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var userName: String = ""
    var imageView: String = "avatar"
    var delegate: AvatarViewDelegate?
    
    func updateName() {
        userNameLabel.text = userName
    }
    
    @IBAction func profileButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.tap(userName: userName, imageView: imageView, index: tag)
        }
    }
    
}
