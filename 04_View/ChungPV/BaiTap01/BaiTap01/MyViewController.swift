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
        // Add user avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "Name"
        userName.textAlignment = .center
        userName.backgroundColor = .blue
        userName.textColor = .white
        view.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidclick), for: .touchUpInside)
        view.addSubview(button)
        
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
