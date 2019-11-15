//
//  UsersViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class UsersViewController: UIViewController {

    private let names: [String] = ["CSS", "IOS", "Android", "Kotlin", "Java", "NodeJS", "Amazon", "MongoDB", "Swift"]
    private let images: [String] = ["girl-1", "girl-2", "girl-3", "girl-4", "girl-5", "girl-6", "girl-7", "girl-8", "girl-9"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        let space: CGFloat = 10
        let widthScreen = UIScreen.main.bounds.width

        let widthUserView: CGFloat = 110
        let heightUserView: CGFloat = 175
        var yUserView: CGFloat = 50
        var xUserView: CGFloat = space

        for index in 0..<names.count {
            let frame = CGRect(x: xUserView, y: yUserView, width: widthUserView, height: heightUserView)

            let userView = createUserView(frame: frame, index: index)
            view.addSubview(userView)

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

    func createUserView(frame: CGRect, index: Int) -> UIView {
        let userView = UIView(frame: frame)

        // Add avatar
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height - 25))
        avatar.image = UIImage(named: images[index])
        avatar.contentMode = .scaleToFill
        userView.addSubview(avatar)

        // Add name
        let name = UILabel(frame: CGRect(x: 0, y: 150, width: userView.bounds.width, height: userView.bounds.height - avatar.bounds.height))
        name.text = names[index]
        name.textAlignment = .center
        name.backgroundColor = .orange
        userView.addSubview(name)

        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: userView.bounds.width, height: userView.bounds.height))
        button.backgroundColor = .clear
        let uiTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
        uiTapGestureRecognizer.name = names[index]
        button.addGestureRecognizer(uiTapGestureRecognizer)
        userView.addSubview(button)

        return userView
    }

    @objc private func buttonDidClick(_ sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("Name User is \(userName ?? "no name")")
    }
}
