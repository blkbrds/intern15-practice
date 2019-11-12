//
//  HomePageViewController.swift
//  BaiTa2.10
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

final class HomePageViewController: UIViewController {

    @IBOutlet weak var avtarScrollView: UIScrollView!

    private var users: [User] = []
    private var heightAvatar = 160
    private var spacing = 10

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        createListAvatar()

        if users.count % 3 == 0 {
            avtarScrollView.contentSize = CGSize(width: 350, height: (users.count / 3 * heightAvatar) + spacing)
        } else {
            avtarScrollView.contentSize = CGSize(width: 350, height: (users.count / 3 + 1) * heightAvatar + spacing)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        let image = UIImage(named: "goku2")
        navigationController?.navigationBar.setBackgroundImage(image?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch), for: .default)
    }

    private func fetchData() {
        DataManagement.share.preparePlistForObject(forResource: "Property", ofType: "plist", withURL: "/Property.plist")
        users = DataManagement.share.getUsers(fileName: "Property", type: "plist")
    }

    private func createListAvatar() {

        var cot: CGFloat = 0
        var dong: CGFloat = 0

        for i in 0..<users.count {
            if i % 3 == 0 && i != 0 {
                cot = 0
                dong += 1
            }
            let originX = ((avtarScrollView.frame.width - 2 * CGFloat(spacing)) / 3 + CGFloat(spacing)) * cot
            let originY = (CGFloat(heightAvatar) + CGFloat(spacing)) * dong
            let avatarView = AvatarView(frame: CGRect(x: originX, y: originY, width: (avtarScrollView.frame.width - CGFloat(spacing) * 2) / 3, height: CGFloat(heightAvatar)))
            if let image = UIImage(named: users[i].avatarImageName) {
                avatarView.avatarImageView.image = image
            } else {
                avatarView.avatarImageView.image = UIImage(named: "goku7")
            }
            avatarView.userNameLabel.text = users[i].userName
            avatarView.indexOfUser = i
            avtarScrollView.addSubview(avatarView)
            avatarView.delegate = self
            cot += 1
        }
    }
}

extension HomePageViewController: AvatarViewDelegate {
    func tap(user: String?, withIndex: Int) {
        let vc = ProfileViewController()
        vc.user = users[withIndex]
        navigationController?.pushViewController(vc, animated: true)
    }
}
