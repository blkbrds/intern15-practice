//
//  HomeViewController.swift
//  Baitap02
//
//  Created by PCI0008 on 12/11/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let userNames: [String] = ["Name 1", "Name 2", "Name 3",
                               "Name 4", "Name 5", "Name 6",
                               "Name 7", "Name 8", "Name 9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        var x: Double = 20.0
        var y: Double = 57.0
        var index: Int = 0
        for i in 0...2 {
            for j in 0...2 {
                switch i {
                case 0: index = j
                case 1: index = j + 3
                case 2: index = j + 6
                default: break
                }
                createUser(x: x, y: y, index: index)
                x += 120.0
                index += 1
            }
            x = 20.0
            y += 225.0
        }
    }

    func createUser(x: Double, y: Double, index: Int) {
        //Add user avatar
        let frame: CGRect = CGRect(x: x, y: y, width: 100, height: 100)
        let userAvatarImageView: UIImageView = UIImageView(image: UIImage(named: "No Avatar.png"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleToFill
        view.addSubview(userAvatarImageView)

        //Add user name
        let userNameLabel: UILabel = UILabel(frame: CGRect(x: x, y: 100 + y, width: 100, height: 50))
        userNameLabel.text = userNames[index]
        userNameLabel.backgroundColor = .lightGray
        userNameLabel.textColor = .blue
        userNameLabel.textAlignment = .center
        view.addSubview(userNameLabel)
        
        //Add button
        let button = UIButton(frame: CGRect(x: x, y: y, width: 100, height: 250))
        button.backgroundColor = .clear
        button.tag = index
        button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func clickButton(_ sender: UIButton) {
        print(userNames[sender.tag])
    }
}

