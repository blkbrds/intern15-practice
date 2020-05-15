//
//  AvatarView.swift
//  BaiTap2
//
//  Created by PCI0012 on 5/4/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol AvataViewDelegate: class {
    func tap(userName: String, imageView: String, index: Int)
}

class AvatarView: UIView {
    weak var delegate: AvataViewDelegate?
    @IBOutlet weak var avatarViewImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var userName: String = ""
    var imageView: String = "avatar"

    func updateName() {
        nameLabel.text = userName
    }
    
    @IBAction func profileButtonTouchUpInSide(_ sender: Any) {
        if let delegate = delegate {
            delegate.tap(userName: userName, imageView: imageView, index: tag)
        }
    }
}
