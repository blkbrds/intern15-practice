//
//  MyViewController.swift
//  Baitap1
//
//  Created by user on 11/4/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let number = Int.random(in: 0...255  )
        let number1 = Int.random(in: 0...255)
        let number2 = Int.random(in: 0...255 )
        let color = UIColor(displayP3Red: CGFloat(number)/255, green: CGFloat(number1)/255, blue: CGFloat(number2)/255, alpha: 1)
        view.backgroundColor = color
    }

    @IBAction func tapButton(_ sender: Any) {
        let number = Int.random(in: 0...255  )
        let number1 = Int.random(in: 0...255)
        let number2 = Int.random(in: 0...255 )
        let color = UIColor(displayP3Red: CGFloat(number)/255, green: CGFloat(number1)/255, blue: CGFloat(number2)/255, alpha: 1)
        view.backgroundColor = color
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
