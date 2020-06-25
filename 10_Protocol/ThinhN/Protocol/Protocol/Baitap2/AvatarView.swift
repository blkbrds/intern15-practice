//
//  AvatarView.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func showName(subView: AvatarView)
}
class AvatarView: UIView {

    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: AvatarViewDelegate?
    
    func setupName(name: String) {
        nameLabel.text = name 
    }
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        delegate?.showName(subView: self)
    }
}
