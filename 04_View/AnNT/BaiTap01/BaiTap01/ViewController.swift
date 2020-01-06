//
//  ViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/24/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let userView = UserView(frame: CGRect(x: 30, y: 100, width: 100, height: 200))
        userView.imageUserView?.image = UIImage(systemName: "person")
        userView.titleLabel?.text = "Username"
        view.addSubview(userView)
    }

}

