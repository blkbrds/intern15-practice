//
//  MyViewController.swift
//  Bai1
//
//  Created by PCI0002 on 10/1/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    let colors: [UIColor] = [.red, .yellow, .blue]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func buttonclick(_ sender: Any) {
        view.backgroundColor = colors.randomElement()
        
    }
    
    
}
