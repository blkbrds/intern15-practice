//
//  AvatarView.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

protocol AvatarViewDelegate: class {
  func tap(user: String?)
}

class AvatarView: UIView {
  
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
    delegate?.tap(user: userNameLabel.text)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
