//
//  AvatarView.swift
//  Navigation
//
//  Created by ADMIN on 6/20/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func showNameLabel(userView: AvatarView)
}

class AvatarView: UIView {
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: AvatarViewDelegate?
    
    var index: Int = 0
    func updateName(name: String) {
        nameLabel.text = name
    }
    
    @IBAction func buttonTouchUpInsine(_ sender: Any) {
        delegate?.showNameLabel(userView: self)
    }
}
