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

    private var isFirstLoad: Bool = true
    private var indexDidSelect: Int?
    private var listAvatarView: [MyAvatarView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !isFirstLoad {
            guard let indexDidSelect = indexDidSelect else { return }
            listAvatarView[indexDidSelect].updateUI()
        }
        isFirstLoad = false
    }

    override func setupUI() {
        super.setupUI()
        title = "Home"
        view.backgroundColor = .black

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = DummyData.avatars.count * 210 / 3
        scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat(screenHeight))
        let space: CGFloat = 20
        let widthScreen = scrollView.bounds.width

        let widthUserView: CGFloat = 100
        let heightUserView: CGFloat = 175
        var yUserView: CGFloat = 0
        var xUserView: CGFloat = space

        for index in 0..<DummyData.avatars.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)
            let myAvatarView = MyAvatarView(frame: frame, index: index)
            myAvatarView.delegate = self
            myAvatarView.datasource = self

            scrollView.addSubview(myAvatarView)
            listAvatarView.append(myAvatarView)

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

// MARK: - ProfileViewControllerDelegate
extension MyAvatarViewController: ProfileViewControllerDelegate {
    func controller(controller: ProfileViewController, needPerformAction action: ProfileViewController.Action) {
        switch action {
        case .reloadAvatarView(let index, let newName):
            DummyData.avatars[index].avatarName = newName
            listAvatarView[index].updateUI()
        }
    }
}

// MARK: - MyAvatarViewDelegate
extension MyAvatarViewController: MyAvatarViewDelegate {
    func view(view: MyAvatarView, needPerformAction action: MyAvatarView.Action) {
        switch action {
        case .gotoProfile(let index):
            indexDidSelect = index
            let profileVC = ProfileViewController()
            profileVC.avatar = DummyData.avatars[index]
            profileVC.index = index
            profileVC.delegate = self
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
}

// MARK: - MyAvatarViewDatasource
extension MyAvatarViewController: MyAvatarViewDatasource {
    func getUserName(at index: Int) -> String? {
        return DummyData.avatars[index].avatarName
    }

    func getAvatar(at index: Int) -> String? {
        return DummyData.avatars[index].avatarImageName
    }
}

// MARK: - Dummy data
extension MyAvatarViewController {

    struct DummyData {

        static var avatars: [Avatar] = {
            let avatars = [Avatar(avatarName: "CSS", avatarImageName: "girl-1"),
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
                Avatar(avatarName: "AFF", avatarImageName: "girl-4")]
            return avatars
        }()
    }
}
