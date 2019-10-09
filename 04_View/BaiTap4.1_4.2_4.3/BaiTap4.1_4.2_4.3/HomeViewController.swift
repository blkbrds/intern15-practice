//
//  HomeViewController.swift
//  BaiTap4.1_4.2_4.3
//
//  Created by ANH NGUYỄN on 10/8/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var user: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        //Add user
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)

        //add user name
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "User name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)

        //add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    @objc func buttonDidClick() {
        print("Button is clicked!")
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
