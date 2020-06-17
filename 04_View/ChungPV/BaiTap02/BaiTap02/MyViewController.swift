//
//  MyViewController.swift
//  BaiTap02
//
//  Created by MBA0168 on 6/4/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var x: Int = 0
    var y: Int = 0
    let images: [String] = ["avatar1.png", "avatar2.png", "avatar3.png", "avatar4.png",  "avatar5.png", "avatar6.png", "avatar7.png", "avatar8.png", "avatar9.png"]
    let names: [String] = ["Chung", "Pham", "Van", "Ha", "Le", "Huong", "Nguyen", "An", "Ngoc"]
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var index: Int = 0
        for _ in 0...2{
            for _ in 0...2{
                loopUser(x: x, y: y,index: index)
                x = x + 120
                index = index + 1
            }
            x = 0
            y = y + 200
        }
    }
    func loopUser(x: Int, y: Int, index: Int) {
        
        //add avatar
        let frame = CGRect(x: 50+x, y: 100+y, width: 100, height: 100)
        let avatarImageView = UIImageView(image: UIImage(named: images[index]))
        avatarImageView.frame = frame
        avatarImageView.backgroundColor = .gray
        avatarImageView.contentMode = .scaleToFill
        view.addSubview(avatarImageView)
        
        // Add user name
        let nameLabel = UILabel(frame: CGRect(x: 50 + x, y: 200 + y, width: 100, height: 20))
        nameLabel.text = names[index]
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .blue
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        
        //can click avatar
        
        avatarImageView.resignFirstResponder()
        let avatarTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick(sender:)))
        avatarTapGestureRecognizer.name = names[index]
        avatarImageView.isUserInteractionEnabled  = true
        avatarImageView.addGestureRecognizer(avatarTapGestureRecognizer)
        
        // Add button
        let nameButton = UIButton(frame: CGRect(x: 50 + x, y: 200 + y, width: 100, height: 120))
        nameButton.backgroundColor = .clear
        let buttonTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonDidClick(sender:)))
        buttonTapGestureRecognizer.name = names[index]
        nameButton.addGestureRecognizer(buttonTapGestureRecognizer)
        view.addSubview(nameButton)
    }
        @objc func buttonDidClick(sender: UITapGestureRecognizer) {
            let userName = sender.name
            print(userName!)
            
        }
        
}


