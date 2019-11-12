//
//  Avatar.swift
//  BaiTa2.10
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func tap(user: String?, withIndex: Int)
}

class AvatarView: UIView {
    var indexOfUser: Int = 0
    weak var delegate: AvatarViewDelegate?

    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .systemGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5

        avatarImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
        userNameLabel.frame = CGRect(x: 0, y: avatarImageView.frame.maxY, width: self.frame.width, height: self.frame.height * 0.2)

        addSubview(avatarImageView)
        addSubview(userNameLabel)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAvatarView)))
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
        avatarImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
        userNameLabel.frame = CGRect(x: 0, y: avatarImageView.frame.maxY, width: self.frame.width, height: self.frame.height * 0.2)
        addSubview(avatarImageView)
        addSubview(userNameLabel)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAvatarView)))
    }

    @objc private func handleAvatarView() {
        delegate?.tap(user: userNameLabel.text, withIndex: indexOfUser)
    }
}
