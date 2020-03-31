//
//  MyAvatar.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

protocol MyAvatarDelegate: class {
    func nameAvatar(avatar: String)
}

final class MyAvatar: UIView{
    private var avatarImageView: UIImageView = UIImageView(frame: .zero)
    private var usernameLabel: UILabel = UILabel (frame: .zero)
    
    weak var delegate:MyAvatarDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUIView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }
    private func setupUIView(){
        avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 3 * frame.height / 4))
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleToFill
        addSubview(avatarImageView)

        usernameLabel = UILabel(frame: CGRect(x: 0, y:avatarImageView.frame.height, width: frame.width, height: frame.height * 0.2))
        usernameLabel.text = "Name"
        usernameLabel.textAlignment = .center
        usernameLabel.textColor = UIColor.white
        usernameLabel.backgroundColor = UIColor.systemBlue
        addSubview(usernameLabel)
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapGestureRecognizer.name = usernameLabel.text
        usernameLabel.isUserInteractionEnabled = true
        usernameLabel.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc private func tapGesture(){
        if let username = usernameLabel.text{
            delegate?.nameAvatar(avatar: username)
        }
    }
    func updateUI(imageAvatar: String, getUsername: Int){
        avatarImageView.image = UIImage(named: imageAvatar)
        usernameLabel.text = "Name \(getUsername)"
    }
}


