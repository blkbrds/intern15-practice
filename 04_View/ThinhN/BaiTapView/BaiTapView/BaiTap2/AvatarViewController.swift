//
//  MyViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/18/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {
    
    private let names: [String] = ["Name 1", "Name 2", "Name 3", "Name 4", "Name 5", "Name 6", "Name 7", "Name 8", "Name 9"]
    private let images: [String] = ["avatar-1.jpg", "avatar-2.jpg", "avatar-3.jpg", "avatar-4.jpg", "avatar-5.jpg", "avatar-6.jpg", "avatar-7.jpg", "avatar-8.jpg", "avatar-9.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //view.backgroundColor = .white
        let space : CGFloat = 20
        let widthScreen = UIScreen.main.bounds.width
        
        let widthAvatarView: CGFloat = 110
        let heightAvatarView: CGFloat = 175
        var yAvatarView: CGFloat = 50
        var xAvatarView: CGFloat = space
        
        for index in 0..<names.count {
        let frame = CGRect(x: xAvatarView, y: yAvatarView, width: widthAvatarView, height: heightAvatarView)
        let avatarView  = creatAvatarView(frame: frame, index: index)
            view.addSubview(avatarView)
            if xAvatarView + widthAvatarView > widthScreen - xAvatarView {
                yAvatarView += heightAvatarView + space
                xAvatarView = space
            }else{
                xAvatarView += widthAvatarView + space
            }
        }
    }
    
    func creatAvatarView(frame: CGRect,index:Int)-> UIView {
        let avatarView = UIView(frame: frame)
        
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width:avatarView.bounds.width , height: avatarView.bounds.height - 25))
        avatar.image = UIImage(named: images[index])
        avatar.contentMode = .scaleToFill
        avatarView.addSubview(avatar)
        
        let name = UILabel(frame: CGRect(x: 0, y: 150, width: avatarView.bounds.width, height: avatarView.bounds.height - avatar.bounds.height))
        name.text = names[index]
        name.textAlignment = .center
        name.backgroundColor = .systemBlue
        name.textColor = .white
        avatarView.addSubview(name)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: avatar.bounds.width, height: avatarView.bounds.height))
        button.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonDiDClick))
        tap.name = names[index]
        button.addGestureRecognizer(tap)
        avatarView.addSubview(button)
        
        return avatarView
    }
    
    @objc private func buttonDiDClick(_ sender:UITapGestureRecognizer){
        let avatar = sender.name
        print(" User name is \(avatar ?? "no name") ")
    }
}

