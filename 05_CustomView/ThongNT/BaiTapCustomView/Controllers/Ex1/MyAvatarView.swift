//
//  MyAvatar.swift
//  BaiTapCustomView
//
//  Created by PCI0018 on 10/14/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyAvatarViewDelegate: class {
    func myAvatarView(myAvatarView: MyAvatarView, didSelect name: String)
}

class MyAvatarView: UIView {
    var userAvatarImageView: UIImageView?
    var userNameLabel: UILabel?

    weak var delegate: MyAvatarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        //add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatarImageView = UIImageView(image: UIImage(named: "Avatar.png"))
        userAvatarImageView?.frame = frame
        userAvatarImageView?.contentMode = .scaleToFill
        addSubview(userAvatarImageView!)

        //add user name
        userNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userNameLabel?.text = "Ahihi"
        userNameLabel?.backgroundColor = .lightGray
        userNameLabel?.textColor = .blue
        userNameLabel?.textAlignment = .center
        addSubview(userNameLabel!)

        //Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        button.isUserInteractionEnabled = true
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        addSubview(button)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonClick() {
        guard let name = userNameLabel!.text else { return }
        delegate?.myAvatarView(myAvatarView: self, didSelect: name)
    }

}
