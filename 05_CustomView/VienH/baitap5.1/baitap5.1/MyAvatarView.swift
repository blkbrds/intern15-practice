//
//  MyAvatarView.swift
//  baitap5.1
//
//  Created by user on 11/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

protocol MyAvatarViewDelegate: class {
    func myAvatarView(myAvatarView: MyAvatarView, didSelect name: String)
}

final class MyAvatarView: UIView {

    weak var delegate: MyAvatarViewDelegate?
    var userAvatarImageView: UIImageView
    var userNameLabel: UILabel

    override init(frame: CGRect) {

        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatarImageView = UIImageView(image: UIImage(named: "download.jpeg"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        userNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userNameLabel.text = "Ahihi"
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textColor = .blue
        userNameLabel.textAlignment = .center

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        button.isUserInteractionEnabled = true
        button.backgroundColor = .clear

        super.init(frame: frame)
        addSubview(userAvatarImageView)
        addSubview(userNameLabel)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        addSubview(button)
        addSubview(userAvatarImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonClick() {
    }
}

