//
//  MyAvatar.swift
//  Baitap01
//
//  Created by PCI0008 on 12/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func showUserName(view: MyAvatar, userName: String)
}

class MyAvatar: UIView {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!

    @IBOutlet weak var button: UIButton!

    weak var delegate: MyAvatarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userImageView.frame = frame
        userImageView.contentMode = .scaleToFill
        addSubview(userImageView)

        userNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 20))
    }   
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }

    @IBAction func touchUpInsideAvatarButton(_ sender: Any) {
        delegate?.showUserName(view: self, userName: userNameLabel.text!)
    }
}

