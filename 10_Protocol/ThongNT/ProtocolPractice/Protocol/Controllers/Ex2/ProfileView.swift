//
//  ProfileView.swift
//  Protocol
//
//  Created by PCI0018 on 11/5/19.
//

import UIKit

protocol ProfileViewDelegate: class {
    func profileView(view: ProfileView, needsPerform action: ProfileView.Action)
}

final class ProfileView: UIView {
    enum Action {
        case gotoProfileVC(profileName: String)
    }

    weak var delegate: ProfileViewDelegate?
    var profileImageView: UIImageView
    var profileNameLabel: UILabel

    override init(frame: CGRect) {
        //add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        profileImageView = UIImageView(image: UIImage(named: "Avatar_img"))
        profileImageView.frame = frame
        profileImageView.contentMode = .scaleAspectFit

        //add user name
        profileNameLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        profileNameLabel.text = "Ahihi"
        profileNameLabel.backgroundColor = .lightGray
        profileNameLabel.textColor = .blue
        profileNameLabel.textAlignment = .center

        //Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        button.isUserInteractionEnabled = true
        button.backgroundColor = .clear

        super.init(frame: frame)
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        button.addTarget(self, action: #selector(clickAvatarTouchUpInside), for: .touchUpInside)
        addSubview(button)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func clickAvatarTouchUpInside() {
        guard let profileName = profileNameLabel.text else { return }
        delegate?.profileView(view: self, needsPerform: .gotoProfileVC(profileName: profileName))
    }
}
