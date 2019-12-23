//
//  HomeViewController.swift
//  NoStoryBoard
//
//  Created by PCI0020 on 9/28/1398 AP.
//  Copyright © 1398 PCI0020. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func buttonDidClick(_ sender: Any) {
        let number = Int.random(in: 0...255 )
        let number1 = Int.random(in: 0...255)
        let number2 = Int.random(in: 0...255 )
        let color = UIColor(displayP3Red: CGFloat(number)/255, green: CGFloat(number1)/255, blue: CGFloat(number2)/255, alpha: 1)
        view.backgroundColor = color
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
