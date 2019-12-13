//
//  AvatarView.swift
//  Navigation

import UIKit

protocol AvatarViewDelegate: class {
    func avatarView(view: AvatarView, needsPerform action: AvatarView.Action)
}

final class AvatarView: UIView {
    
    enum Action {
        case gotoProfile(username: String)
    }
    
    weak var delegate: AvatarViewDelegate?
    private var userAvatarImageView: UIImageView
    var userNameLabel: UILabel

    override init(frame: CGRect) {
        //add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatarImageView = UIImageView(image: UIImage(named: "Avatar_img"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleAspectFit

        //add user name
        userNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userNameLabel.text = "Ahihi"
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textColor = .blue
        userNameLabel.textAlignment = .center

        //Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        button.isUserInteractionEnabled = true
        button.backgroundColor = .clear

        super.init(frame: frame)
        addSubview(userAvatarImageView)
        addSubview(userNameLabel)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        addSubview(button)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonClick() {
        guard let username = userNameLabel.text else { return }
        delegate?.avatarView(view: self, needsPerform: .gotoProfile(username: username))
    }
}
