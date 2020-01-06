//
//  MyViewController.swift
//  gioithieu
//
//  Created by PCI0006 on 9/29/1398 AP.
//  Copyright © 1398 PCI0006. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonDidClick(_ sender: Any) {
        let number = Int.random(in: 0...255 )
          let number1 = Int.random(in: 0...255)
          let number2 = Int.random(in: 0...255 )
          let color = UIColor(displayP3Red: CGFloat(number)/255, green: CGFloat(number1)/255, blue: CGFloat(number2)/255, alpha: 1)
          view.backgroundColor = color
    }
}
