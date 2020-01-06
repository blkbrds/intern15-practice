//
//  ViewController.swift
//  BaiTap03
//
//  Created by An Nguyễn on 12/27/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let badgeButton = BadgeButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        badgeButton.center = self.view.center
        view.addSubview(badgeButton)
    }


}

