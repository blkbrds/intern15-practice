//
//  HomeAvatarViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class HomeAvatarViewController: BaseViewController {

    @IBOutlet private weak var avatarScrollView: UIScrollView!

    private var user: AvatarData = AvatarData()
    private var users: [AvatarData] = []
    private let maxX: CGFloat = UIScreen.main.bounds.width
    private let minX: CGFloat = 0
    private var y: Int = 0
    private var x: Int = 0

    var exercise: Exercise?

    //MARK: - Override function
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupData()
        updateUserViews()
    }

    override func setupData() {
        super.setupData()
        users = AvatarData.parseData(array: Ex3DataManagement.share.getData())
    }

    //MARK: - Private function
    private func updateUserViews() {
        removeSubview()
        x = 0
        y = 0
        for (index, user) in users.enumerated() {
            configUserView(x: x, y: y, index: index, user: user)
            x += 130
            if x >= Int(maxX) {
                x = Int(minX)
                y += 150
            }
        }
    }

    private func removeSubview() {
        for subView in avatarScrollView.subviews where subView is AvatarView {
            subView.removeFromSuperview()
        }
    }

    private func configUserView(x: Int, y: Int, index: Int, user: AvatarData) {
        let frame = CGRect(x: 30 + x, y: 10 + y, width: 100, height: 130)
        let userView = AvatarView()
        userView.frame = frame
        userView.delegate = self
        userView.userNameLabel.text = user.name
        avatarScrollView.contentSize.height = CGFloat(y) + 300
        avatarScrollView.addSubview(userView)
    }
}

extension HomeAvatarViewController: AvatarViewDelegate {
    func avatarView(view: AvatarView, needsPerform action: AvatarView.Action) {
        switch action {
        case .gotoProfile(let username):
            UserDefaults.standard.set(username, forKey: "usernameClicked")
        }
        let vc = ProfileViewController()
        vc.users = users
        navigationController?.pushViewController(vc, animated: true)
    }
}

