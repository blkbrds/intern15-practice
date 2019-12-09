//
//  MyAvatarViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0002 on 11/15/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MyAvatarViewController: BaseViewController {

    @IBOutlet private weak var scrollView: UIScrollView!

    private var avatars: [Avatar] = []
    var didSelectIndex: Int?
    private var isFirstLoad: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
        isFirstLoad = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isFirstLoad {
            let indexRow = UserDefaults.standard.integer(forKey: Key.indexRow.rawValue)
            guard let avatarName = UserDefaults.standard.string(forKey: Key.avatarName.rawValue) else {
                return }
            UserDefaults.standard.set(nil, forKey: Key.avatarName.rawValue)
            UserDefaults.standard.set(nil, forKey: Key.indexRow.rawValue)
            if indexRow >= 0 && indexRow < avatars.count {
                avatars[indexRow].avatarName = avatarName
            }

            for subview in scrollView.subviews where subview.tag == indexRow {
                guard let myAvatar = subview as? MyAvatarView else { return }
                myAvatar.updateUI(avatar: avatars[indexRow])
            }
        }
    }

    override func setupData() {
        super.setupData()

        avatars = [Avatar(avatarName: "CSS", avatarImageName: "girl-1"),
            Avatar(avatarName: "CSS", avatarImageName: "girl-2"),
            Avatar(avatarName: "HTML", avatarImageName: "girl-3"),
            Avatar(avatarName: "Android", avatarImageName: "girl-4"),
            Avatar(avatarName: "IOS", avatarImageName: "girl-5"),
            Avatar(avatarName: "Swift", avatarImageName: "girl-6"),
            Avatar(avatarName: "Object-c", avatarImageName: "girl-7"),
            Avatar(avatarName: "Java", avatarImageName: "girl-8"),
            Avatar(avatarName: "Kotlin", avatarImageName: "girl-1"),
            Avatar(avatarName: "python", avatarImageName: "girl-2"),
            Avatar(avatarName: "Javascript", avatarImageName: "girl-3"),
            Avatar(avatarName: "C++", avatarImageName: "girl-4"),
            Avatar(avatarName: "C", avatarImageName: "girl-5"),
            Avatar(avatarName: "C#", avatarImageName: "girl-6"),
            Avatar(avatarName: "php", avatarImageName: "girl-7"),
            Avatar(avatarName: "lavarel", avatarImageName: "girl-8"),
            Avatar(avatarName: "spring", avatarImageName: "girl-9"),
            Avatar(avatarName: "reacte", avatarImageName: "girl-9"),
            Avatar(avatarName: "ruby", avatarImageName: "girl-1"),
            Avatar(avatarName: "NodeJS", avatarImageName: "girl-3"),
            Avatar(avatarName: "Bootrap", avatarImageName: "girl-2"),
            Avatar(avatarName: "AAA", avatarImageName: "girl-4"),
            Avatar(avatarName: "BBB", avatarImageName: "girl-5"),
            Avatar(avatarName: "CCC", avatarImageName: "girl-6"),
            Avatar(avatarName: "CDD", avatarImageName: "girl-7"),
            Avatar(avatarName: "EEE", avatarImageName: "girl-8"),
            Avatar(avatarName: "FFF", avatarImageName: "girl-1"),
            Avatar(avatarName: "VVV", avatarImageName: "girl-2"),
            Avatar(avatarName: "ZZZ", avatarImageName: "girl-3"),
            Avatar(avatarName: "VVV", avatarImageName: "girl-4"),
            Avatar(avatarName: "AAA", avatarImageName: "girl-5"),
            Avatar(avatarName: "NNN", avatarImageName: "girl-6"),
            Avatar(avatarName: "ddd", avatarImageName: "girl-7"),
            Avatar(avatarName: "AFG", avatarImageName: "girl-8"),
            Avatar(avatarName: "ADA", avatarImageName: "girl-9"),
            Avatar(avatarName: "AFf", avatarImageName: "girl-1"),
            Avatar(avatarName: "AFF", avatarImageName: "girl-4"),]
    }

    override func setupUI() {
        super.setupUI()
        title = "Home"
        view.backgroundColor = .black

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = avatars.count * 210 / 3
        scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(screenHeight))
        let space: CGFloat = 20
        let widthScreen = scrollView.bounds.width

        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 175
        var yUserView: CGFloat = 0
        var xUserView: CGFloat = space

        for index in 0..<avatars.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)

            let myAvatarView = MyAvatarView(frame: frame)
            myAvatarView.tag = index
            myAvatarView.updateUI(avatar: avatars[index])
            myAvatarView.delegate = self
            scrollView.addSubview(myAvatarView)

            // Tinh frame
            if xUserView + widthUserView > widthScreen - xUserView {
                // Thay doi y va x
                yUserView += heightUserView + space
                xUserView = space
            } else {
                xUserView += widthUserView + space
            }
        }
    }
}

extension MyAvatarViewController: MyAvatarDelegate {
    func goToProfile(myAvatar: MyAvatarView, avatar: Avatar) {
        UserDefaults.standard.set(myAvatar.tag, forKey: Key.indexRow.rawValue)
        let profileVC = ProfileViewController()
        profileVC.avatar = avatar
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
