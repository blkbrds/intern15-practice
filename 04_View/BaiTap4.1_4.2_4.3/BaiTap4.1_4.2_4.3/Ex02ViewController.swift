//
//  Ex02ViewController.swift
//  BaiTap4.1_4.2_4.3
//
//  Created by ANH NGUYỄN on 10/8/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
struct Person {
    var name: String
    var avatar: String

    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
final class Ex02ViewController: UIViewController {
    var user: [Person] =
        [Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png"),
            Person(name: "Hanh", avatar: "avatar.png")]
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
    }
    func addProfileView(frame: CGRect, user: Person) -> UIView {
        let contaier = UIView(frame: frame)
        let userAvatar = UIImageView(image: UIImage(named: user.avatar))
        userAvatar.frame = CGRect(x: 0, y: 0, width: 120, height: 130)
        contaier.backgroundColor = .red
        contaier.addSubview(userAvatar)

        let userName = UILabel(frame: CGRect(x: 0, y: 130, width: 120, height: 30))
        userName.text = user.name
        userName.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        userName.textColor = .white
        contaier.addSubview(userName)

        return contaier
    }
    func show() {
        var x: CGFloat = 12
        var y: CGFloat = 40
        for i in 0..<user.count {
            let frame = CGRect(x: x, y: y, width: 120, height: 130)
            let container = addProfileView(frame: frame, user: user[i])
            view.addSubview(container)
            x += 135
            if x >= UIScreen.main.bounds.width {
                x = 10
                y += 160 + 10
            }
        }

    }

}
