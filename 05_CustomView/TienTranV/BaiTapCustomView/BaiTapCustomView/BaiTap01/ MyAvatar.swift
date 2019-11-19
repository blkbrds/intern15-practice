//
//   MyAvatar.swift
//  BaiTapCustomView
//
//  Created by PCI0002 on 11/15/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func nameAvatar(avatar: String)
}

final class MyAvatarView: UIView {

    private var userAvatarImageView: UIImageView?
    private var userNameLabel: UILabel?
    
    weak var delegate: MyAvatarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        userNameLabel?.backgroundColor = .orange
        userNameLabel?.text = "Messi"
        userNameLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guard let userNameLabel = userNameLabel else { return }
        addSubview(userNameLabel)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        tapGestureRecognizer.name = userNameLabel.text
        userNameLabel.isUserInteractionEnabled = true
        userNameLabel.addGestureRecognizer(tapGestureRecognizer)
    }

    func updateUI(image: String = "", name: String) {
        userAvatarImageView?.image = UIImage(named: image)
        userNameLabel?.text = name
    }

    @objc func buttonDidClick(sender: UITapGestureRecognizer) {
        if let userName = userNameLabel?.text {
            delegate?.nameAvatar(avatar: userName)
        }
    }
}
