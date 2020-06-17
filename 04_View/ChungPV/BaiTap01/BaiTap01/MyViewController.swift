//
//  MyViewController.swift
//  BaiTap01
//
//  Created by MBA0168 on 6/3/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let avatarImageView = UIImageView(image: UIImage(named: "avatar.png"))
        avatarImageView.frame = frame
        avatarImageView.contentMode = .scaleToFill
        view.addSubview(avatarImageView)
        
        // Add user name
        let nameLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
        nameLabel.text = "Name"
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .blue
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        
        // Add button
        let nameButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 130))
        nameButton.backgroundColor = .clear
        nameButton.addTarget(self, action: #selector(buttonDidclick), for: .touchUpInside)
        view.addSubview(nameButton)
        
        }
        @objc func buttonDidclick() {
                print("Name")
        }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
