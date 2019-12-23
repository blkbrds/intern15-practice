//
//  HomeViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 12/19/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var emailButton: BadgeNumberButton!
    var friendsButton: BadgeNumberButton!
    var photosButton: BadgeNumberButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        emailButton = Bundle.main.loadNibNamed("BadgeNumberButton", owner: self, options: nil)![0] as? BadgeNumberButton
        emailButton.frame = CGRect(x: 150, y: 100, width: 50, height: 50)
        emailButton.backgroundColor = .green
        view.addSubview(emailButton)
        emailButton.labelView.text = "0"
        if(emailButton.labelView.text == "0") {
            emailButton.labelView.isHidden = true
        }
        
        friendsButton = Bundle.main.loadNibNamed("BadgeNumberButton", owner: self, options: nil)![0] as? BadgeNumberButton
        friendsButton.frame = CGRect(x: 150, y: 250, width: 50, height: 50)
        friendsButton.backgroundColor = .yellow
        view.addSubview(friendsButton)
        friendsButton.labelView.text = "9"
        if(friendsButton.labelView.text == "0") {
            friendsButton.labelView.isHidden = true
        }
        
        photosButton = Bundle.main.loadNibNamed("BadgeNumberButton", owner: self, options: nil)![0] as? BadgeNumberButton
        photosButton.frame = CGRect(x: 150, y: 400, width: 50, height: 50)
        photosButton.backgroundColor = .purple
        view.addSubview(photosButton)
        photosButton.labelView.text = "10"
        if(photosButton.labelView.text == "0") {
            photosButton.labelView.isHidden = true
        }
    }

}

