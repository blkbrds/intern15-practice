//
//  ViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 4/6/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let add = ToaDo(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        add.values = [100.0,200.0,50.0]
        view.addSubview(add)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
