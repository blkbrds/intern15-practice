//
//  MyAvatarViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0002 on 11/15/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class MyAvatarViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    private let names: [String] = ["CSS", "IOS", "Android", "Kotlin", "Java", "NodeJS", "Amazon", "MongoDB", "Swift", "CSS", "IOS", "Android", "Kotlin", "Java", "NodeJS", "Amazon", "MongoDB", "Swift", "CSS", "IOS", "Android", "Kotlin", "Java", "NodeJS", "Amazon", "MongoDB", "Swift", "CSS", "IOS", "Android", "Kotlin", "Java", "NodeJS", "Amazon", "MongoDB", "Swift"]
    private let images: [String] = ["girl-1", "girl-2", "girl-3", "girl-4", "girl-5", "girl-6", "girl-7", "girl-8", "girl-9",
        "girl-1", "girl-2", "girl-3", "girl-4", "girl-5", "girl-6", "girl-7", "girl-8", "girl-9", "girl-1", "girl-2", "girl-3", "girl-4", "girl-5", "girl-6", "girl-7", "girl-8", "girl-9",
        "girl-1", "girl-2", "girl-3", "girl-4", "girl-5", "girl-6", "girl-7", "girl-8", "girl-9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .green
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2220)
        let space: CGFloat = 10
        let widthScreen = scrollView.bounds.width

        let widthUserView: CGFloat = 100
        print(widthUserView)
        let heightUserView: CGFloat = 175
        var yUserView: CGFloat = 0
        var xUserView: CGFloat = space

        for index in 0..<names.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)

            let avatar = MyAvatarView(frame: frame)

            avatar.updateUI(imageName: images[index], name: names[index])
            avatar.delegate = self
            scrollView.addSubview(avatar)

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
    func nameAvatar(avatar: String) {
        print(avatar)
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...255) / 255, green: CGFloat.random(in: 0...255) / 255, blue: CGFloat.random(in: 0...255) / 255, alpha: 1)
    }
}
