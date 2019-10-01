//
//  MyViewController.swift
//  baiTap01
//
//  Created by PCI0018 on 9/30/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class MyViewController: UIViewController{

    let color : [UIColor] = [.black, .green, .blue, .yellow, .darkGray, .brown, .darkText, .gray]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

        
    @IBAction func method_tape(_ sender: Any) {
        let i : Int = Int.random(in: 0...7)
        view.backgroundColor = color[i]
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
