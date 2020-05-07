//
//  AvatarView.swift
//  BaiTapClosure
//
//  Created by PCI0002 on 5/6/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    enum TypeView {
        case on
        case off
    }

    var type: TypeView = .on

    init(type: TypeView = .on) {
        super.init(frame: CGRect.zero)
        self.type = type
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.cornerRadius = layer.frame.size.height / 2
        clipsToBounds = true

        let userAvatar = UIImageView(image: UIImage(named: "cat"))
        userAvatar.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(userAvatar)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override class func awakeFromNib() {
        super.awakeFromNib()

    }
}
