//
//  HomeViewController.swift
//  BaiTap01
//
//  Created by PCI0012 on 3/5/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let arrayColor = [UIColor.red, UIColor.white, UIColor.green, UIColor.yellow,UIColor.blue, UIColor.brown, UIColor.black]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func tap(_ sender: UIButton) {
        let index = Int.random(in: 0...6)
        view.backgroundColor = arrayColor[index]
    }
}
