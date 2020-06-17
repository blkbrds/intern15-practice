//
//  MyViewController.swift
//  BaiTap01
//
//  Created by MBA0168 on 5/5/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var changeColorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func changeColor(_ sender: Any) {
        let redcolor = CGFloat.random(in: 0...1)
        let greencolor = CGFloat.random(in: 0...1)
        let bluecolor = CGFloat.random(in: 0...1)
          
        let randomColor = UIColor(red: redcolor, green: greencolor, blue: bluecolor, alpha: 1.0)
        view.backgroundColor = randomColor
    }
    
}

