//
//  AvatarViewController.swift
//  BaitapView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
  
  let userName: [String] = ["Bat Man", "Super Man", "Wonder Woman", "Hulk", "Iron Man", "Thor","Captain Amercian" , "Black Panther", "Thanos","anc"]
  let img: [String] = ["bat_man.jpg", "super_man.jpeg", "wonder_woman.jpg", "hulk.jpg", "iron_man.jpg", "thor.jpeg",
                       "Captain.jpg", "black_panter.jpeg", "thanos.jpg","aaa"]
  let spacing: CGFloat = 10
  var heightAvatarView = 160
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var cot = 0
    var dong = 0
    for i in 0..<userName.count{
      if i % 3 == 0 && i != 0{
        cot = 0
        dong += 1
        creatAvatarView(x: 20 + (((UIScreen.main.bounds.width - 40) - 2 * spacing ) / 3 + spacing) * CGFloat(cot), y: 70 + (160 + spacing) * CGFloat(dong),image: img[i],name: userName[i])
      }else {
        creatAvatarView(x: 20 + (((UIScreen.main.bounds.width - 40) - 2 * spacing ) / 3 + spacing) * CGFloat(cot), y: 70 + (160 + spacing) * CGFloat(dong),image: img[i],name: userName[i])
      }
      cot += 1
    }
  }
  
  func creatAvatarView(x: CGFloat = 20, y: CGFloat = 70, image: String = "DefaultAvatar.png", name: String = "User name") {
    let width = ((UIScreen.main.bounds.width - 40) - 2 * spacing ) / 3
    let height: CGFloat =  160
    
    let avatarView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
    avatarView.layer.borderWidth = 2
    avatarView.layer.borderColor = UIColor.black.cgColor
    view.addSubview(avatarView)
    
    let userAvatar = UIImageView()
    if let img = UIImage(named: image) {
      userAvatar.image = img
    }else {
      userAvatar.image = UIImage(named: "DefaultAvatar.png")
    }
    userAvatar.frame = CGRect(x: 0, y: 0, width: avatarView.bounds.width, height: avatarView.bounds.height * 0.8)
    userAvatar.contentMode = .scaleToFill
    userAvatar.isUserInteractionEnabled = true
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleBtn))
    tapGesture.name = name
    userAvatar.addGestureRecognizer(tapGesture)
    avatarView.addSubview(userAvatar)
    
    let userName = UILabel(frame: CGRect(x: 0, y: userAvatar.bounds.height, width:  avatarView.bounds.width, height:  avatarView.bounds.height * 0.2))
    userName.text = name
    userName.numberOfLines = 0
    userName.font = UIFont.systemFont(ofSize: 12)
    userName.textAlignment = .center
    userName.backgroundColor = .lightGray
    userName.textColor = .blue
    avatarView.addSubview(userName)
  }
  
  @objc func handleBtn(_ sender: UITapGestureRecognizer) {
    guard let name = sender.name else { return }
    print("Click", name)
  }
  
}
