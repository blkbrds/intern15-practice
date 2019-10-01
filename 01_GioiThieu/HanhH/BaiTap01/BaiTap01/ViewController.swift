//
//  ViewController.swift
//  BaiTap01
//
//  Created by PCI0020 on 10/1/19.
//  Copyright © 2019 PCI0020. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tap(_ sender: Any) {
        print("helo")
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        view.backgroundColor =  UIColor(red: red, green: green, blue: blue, alpha: 1.0)    }
    
}

