//
//   MyAvatar.swift
//  BaiTapCustomView
//
//  Created by PCI0002 on 11/15/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func goToProfile(myAvatar: MyAvatarView, avatar: Avatar)

}


final class MyAvatarView: UIView {

    private var userAvatarImageView: UIImageView?
    var userNameLabel: UILabel?

    var avatar: Avatar?

    weak var delegate: MyAvatarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // Add user avatar
        userAvatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 3 * frame.height / 4))
        userAvatarImageView?.image = UIImage(named: "avatar-man")
        userAvatarImageView?.contentMode = .scaleToFill
        guard let userAvatar = userAvatarImageView else { return }
        addSubview(userAvatar)

        // Add user name
        userNameLabel = UILabel(frame: CGRect(x: 0, y: userAvatar.frame.height, width: frame.width, height: frame.height - userAvatar.frame.height))
        userNameLabel?.textAlignment = .center
        userNameLabel?.backgroundColor = .white
        userNameLabel?.text = "Messi"
        userNameLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let userNameLabel = userNameLabel else { return }
        addSubview(userNameLabel)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        tapGestureRecognizer.name = userNameLabel.text
        userNameLabel.isUserInteractionEnabled = true
        userNameLabel.addGestureRecognizer(tapGestureRecognizer)
    }

    func updateUI(avatar: Avatar) {
        self.avatar = avatar
        userAvatarImageView?.image = UIImage(named: avatar.avatarImageName)
        userNameLabel?.text = avatar.avatarName
    }

    @objc func buttonDidClick(sender: UITapGestureRecognizer) {
        guard let avatar = avatar else { return }
        delegate?.goToProfile(myAvatar: self, avatar: avatar)
    }
}
