//
//  ViewController.swift
//  BaiTap1vaBaiTap2
//
//  Created by PCI0012 on 3/23/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 0
    let arr: [String] = ["ro1","ro2","ro3","ro4","ro5","ro6","ro7","ro8","ro9"]

    override func viewDidLoad() {
        super.viewDidLoad()

        var toaDoX = 35
        var toaDoY = 100
        
        for i in 0..<9 {
            
            //add user avatar
            let frame = CGRect(x: toaDoX, y: toaDoY, width: 100, height: 100)
            let userAvatar = UIImageView(image: UIImage(named: "ronaldo"))
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            view.addSubview(userAvatar)
            
            //add user name
            let userName = UILabel(frame: CGRect(x: toaDoX, y: toaDoY + 100, width: 100, height: 25))
            userName.text = arr[i]
            userName.backgroundColor = .lightGray
            userName.textAlignment = .center
            userName.textColor = .blue
            view.addSubview(userName)
            
            //kich vao avatar print ten user
            let button = UIButton(frame: CGRect(x: toaDoX, y: toaDoY, width: 100, height: 125))
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(name), for: .touchUpInside)
            view.addSubview(button)
            
            button.tag = i
            toaDoX += 120
            if (i + 1) % 3 == 0 {
                toaDoY += 150
                toaDoX = 35
            }
        }
    }
    
    @objc func name(sender: UIButton) {
        print("Content at is : \(arr[sender.tag])")
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
