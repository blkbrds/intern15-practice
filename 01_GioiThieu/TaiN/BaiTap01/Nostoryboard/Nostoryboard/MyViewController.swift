//
//  MyViewController.swift
//  Nostoryboard
//
//  Created by PCI0006 on 10/1/19.
//  Copyright © 2019 PCI0006. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    let colors: [UIColor] = [.red,.yellow,.black,.blue]

    @IBAction func button(_ sender: Any) {
        view.backgroundColor = colors.randomElement()
    }
    

}
