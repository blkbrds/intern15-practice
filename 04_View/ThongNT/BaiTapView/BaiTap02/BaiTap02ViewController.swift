//
//  BaiTap02ViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/8/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class BaiTap02ViewController: UIViewController {

    struct User {
        let name: String
        let avatar: String
    }

    let users: [User] = [User(name: "Name 1", avatar: "avatar.png"),
        User(name: "Name 2", avatar: "avatar.png"),
        User(name: "Name 3", avatar: "avatar.png"),
        User(name: "Name 4", avatar: "avatar.png"),
        User(name: "Name 5", avatar: "avatar.png"),
        User(name: "Name 6", avatar: "avatar.png"),
        User(name: "Name 7", avatar: "avatar.png"),
        User(name: "Name 8", avatar: "avatar.png"),
        User(name: "Name 9", avatar: "avatar.png")]
    var y: Int = 0
    var x: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        var index: Int = 0
        for _ in 0...2 {
            for _ in 0...2 {
                createUser(x: x, y: y, index: index)
                x += 130
                index += 1
            }
            x = 0
            y += 200
        }
    }

    func createUser(x: Int, y: Int, index: Int) {
        // add avatar
        let frame = CGRect(x: 20 + x, y: 50 + y, width: 120, height: 120)
        let userAvatar = UIImageView(image: UIImage(named: users[index].avatar))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill

        // cho phép chạm
        userAvatar.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapUserAvatar(sender:)))
        tap.name = users[index].name

        userAvatar.addGestureRecognizer(tap)
        view.addSubview(userAvatar)

        // add user name
        let userName = UILabel(frame: CGRect(x: 20 + x, y: 170 + y, width: 120, height: 40))
        userName.text = users[index].name
        userName.backgroundColor = .white
        userName.textColor = .black
        userName.textAlignment = .center
        view.addSubview(userName)
        //   UIScreen.main.bounds.width


    }

    @objc func tapUserAvatar(sender: UITapGestureRecognizer) {
        guard let name = sender.name else { return }
        print (name)
    }

}
