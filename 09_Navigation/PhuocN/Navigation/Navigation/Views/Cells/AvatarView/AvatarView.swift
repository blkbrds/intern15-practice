//
//  AvatarView.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
    func tap(user: String?, withIndex: Int)
}

class AvatarView: UIView {
    
    var index: Int = 0
    weak var delegate: AvatarViewDelegate?
    let avatarImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        return img
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
    
    @objc func handleAvatarView() {
        delegate?.tap(user: userNameLabel.text, withIndex: index)
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
}
