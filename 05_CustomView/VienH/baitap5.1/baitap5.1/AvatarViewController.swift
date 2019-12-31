//
//  AvatarViewController.swift
//  baitap5.1
//
//  Created by user on 11/18/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let imageName: String
}

final class AvatarViewController: UIViewController {
    @IBOutlet private weak var avatarScrollView: UIScrollView!

    private var y: Int = 0
    private var x: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        var index: Int = 1
        for _ in 0...10 {
            for _ in 0...2 {
                createUser(x: x, y: y, index: index)
                x += 130
                index += 1
            }
            x = 0
            y += 150
        }
    }

    func createUser(x: Int, y: Int, index: Int) {
        let frame = CGRect(x: 30 + x, y: 50 + y, width: 100, height: 130)
        let userView = MyAvatarView()
        userView.frame = frame
        userView.delegate = self
        userView.userNameLabel.text = "Name \(index)"
        avatarScrollView.contentSize.height = CGFloat(y) + 400
        avatarScrollView.addSubview(userView)
    }
}

extension AvatarViewController: MyAvatarViewDelegate {

    func myAvatarView(myAvatarView: MyAvatarView, didSelect name: String) {
        print("select user \(name)")
    }
}
