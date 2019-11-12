//
//  MyViewController.swift
//  BaiTap02
//
//  Created by PCI0002 on 11/12/19.
//  Copyright © 2019 PCI0002. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    let arrayName: [String] = ["CSS", "IOS", "Android", "Kotlin", "Java", "NodeJS", "Amazon", "MongoDB", "Swift"]
    let arrayImage: [String] = ["girl-1.jpeg", "girl-2.jpeg", "girl-3.jpeg", "girl-4.jpeg", "girl-5.jpeg", "girl-6.jpeg", "girl-7.jpeg", "girl-8.jpeg", "girl-9.jpeg"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let space: CGFloat = 5
        let widtthAvatarView = UIScreen.main.bounds.width / 3 - 1.5 * space
        var heightAvatarView: CGFloat = 50
        var count = 0

        for _ in 0...2 {
            for j in 0...2 {
                // Add user avatar
                let userAvatar = UIImageView(frame: CGRect(x: space + CGFloat(j) * (space + widtthAvatarView), y: heightAvatarView, width: widtthAvatarView, height: 150))
                userAvatar.image = UIImage(named: arrayImage[count])
                userAvatar.contentMode = .scaleAspectFit
                view.addSubview(userAvatar)

                // Add user name
                let userName = UILabel(frame: CGRect(x: space + CGFloat(j) * (space + widtthAvatarView), y: 150 + heightAvatarView, width: widtthAvatarView, height: 25))
                userName.backgroundColor = .green
                userName.text = arrayName[count]
                userName.textAlignment = .center
                view.addSubview(userName)

                // Add button
                let button = UIButton(frame: CGRect(x: space + CGFloat(j) * (space + widtthAvatarView), y: heightAvatarView, width: widtthAvatarView, height: 175))
                button.backgroundColor = .clear
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick))
                tapGesture.name = arrayName[count]
                button.addGestureRecognizer(tapGesture)
                view.addSubview(button)

                count += 1
            }
            heightAvatarView += 175 + 10
        }
    }

    @objc func buttonDidClick(_ sender: UITapGestureRecognizer) {
        let userName = sender.name
        print("Name User is \(userName ?? "no name")")
    }
}
