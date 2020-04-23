//
//  MyViewController.swift
//  Baitap1
//
//  Created by PCI0019 on 3/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: Any) {
    let number0 = Int.random(in: 0...255 )
    let number1 = Int.random(in: 0...255)
    let number2 = Int.random(in: 0...255 )
    let color = UIColor(displayP3Red: CGFloat(number0)/255, green: CGFloat(number1)/255, blue: CGFloat(number2)/255, alpha: 1)
    view.backgroundColor = color
    }
    
}

