//
//  BadgeNumberViewController.swift
//  baiTapCustomView
//
//  Created by ADMIN on 3/29/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class BadgeNumberViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    private func setUpView(){
        let buttonBadgeNumber1 = BadgeNumberButton(frame: CGRect(x: 100, y: 200, width: 200, height: 100), valueBadgeNumber: .topRight, text: "10")
        buttonBadgeNumber1.button?.backgroundColor = UIColor.systemGreen
        buttonBadgeNumber1.button?.setTitle("Email", for: .normal)
        view.addSubview(buttonBadgeNumber1)
        
        let buttonBadgeNumber2 = BadgeNumberButton(frame: CGRect(x: 100, y: 400, width: 200, height: 100), valueBadgeNumber: .topLeft, text: "99+")
        buttonBadgeNumber2.button?.backgroundColor = UIColor.systemYellow
        buttonBadgeNumber2.button?.setTitle("Friends", for: .normal)
        view.addSubview(buttonBadgeNumber2)
        
        let buttonBadgeNumber3 = BadgeNumberButton(frame: CGRect(x: 100, y: 600, width: 200, height: 100), valueBadgeNumber: .topCenter, text: "8")
        buttonBadgeNumber3.button?.backgroundColor = UIColor.systemPurple
        buttonBadgeNumber3.button?.setTitle("Photos", for: .normal)
        view.addSubview(buttonBadgeNumber3)
    }

}
