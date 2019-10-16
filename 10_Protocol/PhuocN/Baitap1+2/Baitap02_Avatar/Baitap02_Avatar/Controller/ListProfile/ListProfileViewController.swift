//
//  ListProfileViewController.swift
//  Baitap02_Avatar
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class ListProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileScrollView: UIScrollView!
    
    var users: [User] = []
    let heightAvatar = 160
    let spacing = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        if users.count % 3 == 0 {
            profileScrollView.contentSize = CGSize(width: 350, height: users.count / 3 * heightAvatar + spacing )
        } else {
            profileScrollView.contentSize = CGSize(width: 350, height: (users.count / 3 + 1) * heightAvatar + spacing)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        createListAvatar()
    }
    
    func fetchData() {
        DataManagement.share.preparePlistForObject(forResource: "users", ofType: "plist", withURL: "/users.plist")
        users = DataManagement.share.getUser(fileName: "users", type: "plist")
        print(users)
        
    }
    
    func createListAvatar() {
        var cot: CGFloat = 0
        var dong: CGFloat = 0
        for i in 0..<users.count{
            if i % 3 == 0 && i != 0{
                cot = 0
                dong += 1
            }
            let originX = ((profileScrollView.frame.width  - 2 * CGFloat(spacing)) / 3 + CGFloat(spacing)) * cot
            let originY = (CGFloat(heightAvatar) +  CGFloat(spacing)) * dong
            let avatar = AvatarView(frame: CGRect(x: originX, y: originY, width: (profileScrollView.frame.width - CGFloat(spacing) * 2) / 3, height: CGFloat(heightAvatar)))
            if let image = UIImage(named: users[i].avatarImageName) {
                avatar.avatarImageView.image = image
            } else {
                avatar.avatarImageView.image = UIImage(named: "DefaultAvatar.png")
            }
            avatar.userNameLabel.text = users[i].username
            avatar.index = i
            profileScrollView.addSubview(avatar)
            avatar.delegate = self
            cot += 1
        }
    }
}

extension ListProfileViewController: AvatarViewDelegate {
    func tap(user: String?, withIndex: Int) {
        let vc = ProfileViewController()
        vc.user = users[withIndex]
        navigationController?.pushViewController(vc, animated: true)
    }
}
