//
//  ListProfilesViewController.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 11/5/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class ListProfilesViewController: UIViewController {

    @IBOutlet weak var listProfilersScrollView: UIScrollView!
    
    var users: [User] = []
    let heightAvatar = 160
    let spacing = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if users.count % 3 == 0 {
            listProfilersScrollView.contentSize = CGSize(width: 350, height: users.count / 3 * heightAvatar + spacing )
        } else {
            listProfilersScrollView.contentSize = CGSize(width: 350, height: (users.count / 3 + 1) * heightAvatar + spacing)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            fetchData()
            createListAvatar()
        }
        
        private func fetchData() {
            Ex2DataManagement.shared.preparePlistForObject(forResource: "Ex2UserProperty", ofType: "plist", withURL: "/Ex2UserProperty.plist")
            users = Ex2DataManagement.shared.getUser(fileName: "Ex2UserProperty", type: "plist")
            print(users)
        }
        
        private func createListAvatar() {
            var cot: CGFloat = 0
            var dong: CGFloat = 0
            for i in 0..<users.count{
                if i % 3 == 0 && i != 0{
                    cot = 0
                    dong += 1
                }
                let originX = ((listProfilersScrollView.frame.width  - 2 * CGFloat(spacing)) / 3 + CGFloat(spacing)) * cot
                let originY = (CGFloat(heightAvatar) +  CGFloat(spacing)) * dong
                let avatar = AvatarView(frame: CGRect(x: originX, y: originY, width: (listProfilersScrollView.frame.width - CGFloat(spacing) * 2) / 3, height: CGFloat(heightAvatar)))
                if let image = UIImage(named: users[i].avatarImageView) {
                    avatar.avatarImageView.image = image
                } else {
                    avatar.avatarImageView.image = UIImage(named: "goku3")
                }
                avatar.userNameLabel.text = users[i].userName
                avatar.indexOfuser = i
                listProfilersScrollView.addSubview(avatar)
                avatar.delegate = self
                cot += 1
            }
        }
    }

    extension ListProfilesViewController: AvatarViewDelegate {
        func tap(user: String?, withIndex: Int) {
            let vc = Ex3ViewController()
            vc.user = users[withIndex]
            navigationController?.pushViewController(vc, animated: true)
        }
}
