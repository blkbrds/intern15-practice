//
//  AvatarViewController.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

struct User {
  let username: String
  let imageName: String
}

class AvatarViewController: UIViewController {
  
  let users = [User(username: "Bat Man", imageName: "bat_man"),
               User(username: "Super Man", imageName: "super_man.jpeg"),
               User(username: "Wonder Woman", imageName: "wonder_woman.jpg"),
               User(username: "Thanos", imageName: "thanos.jpg"),
               User(username: "Iron Man", imageName: "iron_man.jpg"),
               User(username: "Hulk", imageName: "hulk.jpg"),
               User(username: "Captain", imageName: "Captain.jpg"),
               User(username: "Thor", imageName: "thor.jpeg"),
               User(username: "Black Panther", imageName: "black_panter.jpeg"),
               User(username: "Bat Man", imageName: "bat_man.jpg"),
               User(username: "Super Man", imageName: "super_man.jpeg"),
               User(username: "Wonder Woman", imageName: "wonder_woman.jpg"),
               User(username: "Thanos", imageName: "thanos.jpg"),
               User(username: "Iron Man", imageName: "iron_man.jpg"),
               User(username: "Hulk", imageName: "hulk.jpg"),
               User(username: "Captain", imageName: "Captain.jpg"),
               User(username: "Thor", imageName: "thor.jpeg"),
               User(username: "Black Panther", imageName: "black_panter.jpeg"),
               User(username: "Bat Man", imageName: "bat_man.jpg"),
               User(username: "Super Man", imageName: "super_man.jpeg"),
               User(username: "Wonder Woman", imageName: "wonder_woman.jpg"),
               User(username: "Thanos", imageName: "thanos.jpg"),
               User(username: "Iron Man", imageName: "iron_man.jpg"),
               User(username: "Hulk", imageName: "hulk.jpg"),
               User(username: "Captain", imageName: "Captain.jpg"),
               User(username: "Thor", imageName: "thor.jpeg"),
               User(username: "Black Panther", imageName: "black_panter.jpeg"),
               User(username: "Bat Man", imageName: "bat_man.jpg"),
               User(username: "Super Man", imageName: "super_man.jpeg"),
               User(username: "Wonder Woman", imageName: "wonder_woman.jpg"),
               User(username: "Thanos", imageName: "thanos.jpg"),
               User(username: "Iron Man", imageName: "iron_man.jpg"),
               User(username: "Hulk", imageName: "hulk.jpg")]
  let heightAvatar = 160
  let spacing = 10
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.contentSize = CGSize(width: 350, height: users.count % 3 == 0 ? users.count / 3 * heightAvatar + spacing : (users.count / 3 + 1) * heightAvatar + spacing)
    createListAvatar()
  }
  
  func createListAvatar() {
    var cot:CGFloat = 0
    var dong:CGFloat = 0
    for i in 0..<users.count{
      if i % 3 == 0 && i != 0{
        cot = 0
        dong += 1
      }
      let avatar = AvatarView(frame: CGRect(x: ((scrollView.frame.width  - 2 * CGFloat(spacing)) / 3 + CGFloat(spacing)) * cot,y: (CGFloat(heightAvatar) +  CGFloat(spacing)) * dong, width: (scrollView.frame.width - CGFloat(spacing) * 2) / 3, height: CGFloat(heightAvatar)))
      if let image = UIImage(named: users[i].imageName) {
        avatar.avatarImageView.image = image
      } else {
        avatar.avatarImageView.image = UIImage(named: "DefaultAvatar.png")
      }
      avatar.userNameLabel.text = users[i].username
      scrollView.addSubview(avatar)
      avatar.delegate = self
      cot += 1
    }
  }
}

extension AvatarViewController: AvatarViewDelegate {
  func tap(user: String?) {
    guard let user = user else { return }
    print("name: \(user)")
  }
}
