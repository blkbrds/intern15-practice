//
//   MyAvatar.swift
//  BaiTapCustomView
//
//  Created by PCI0002 on 11/15/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol MyAvatarViewDelegate: class {
    func view(view: MyAvatarView, needPerformAction action: MyAvatarView.Action)
}

protocol MyAvatarViewDatasource: class {
    func getUserName(at index: Int) -> String?
    func getAvatar(at index: Int) -> String?
}

final class MyAvatarView: UIView {

    // MARK: - Properties
    private var userAvatarImageView: UIImageView?
    private var userNameLabel: UILabel?
    private var index: Int?

    weak var delegate: MyAvatarViewDelegate?
    weak var datasource: MyAvatarViewDatasource?

    enum Action {
        case gotoProfile(index: Int)
    }

    // MARK: - Init
    init(frame: CGRect, index: Int) {
        super.init(frame: frame)
        self.index = index
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        updateUI()
    }

    // MARK: - Private
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

    @objc private func buttonDidClick(sender: UITapGestureRecognizer) {
        guard let index = index else { return }
        delegate?.view(view: self, needPerformAction: .gotoProfile(index: index))
    }

    // MARK: - Public
    func updateUI() {
        guard let index = index, let imageName = datasource?.getAvatar(at: index), let name = datasource?.getUserName(at: index) else { return }
        userAvatarImageView?.image = UIImage(named: imageName)
        userNameLabel?.text = name
    }
}
