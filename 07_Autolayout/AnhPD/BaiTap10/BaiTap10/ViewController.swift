//
//  ViewController.swift
//  BaiTap10
//
//  Created by PCI0012 on 4/13/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthButton1: NSLayoutConstraint!
    @IBOutlet weak var widthButton2: NSLayoutConstraint!
    @IBOutlet weak var widthButton3: NSLayoutConstraint!
    @IBOutlet weak var widthButton4: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button1(_ sender: Any) {
        widthButton1.constant = 150
        widthButton2.constant = 75
        widthButton3.constant = 75
        widthButton4.constant = 75
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func button2(_ sender: Any) {
        widthButton1.constant = 75
        widthButton2.constant = 150
        widthButton3.constant = 75
        widthButton4.constant = 75
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func button3(_ sender: Any) {
        widthButton1.constant = 75
        widthButton2.constant = 75
        widthButton3.constant = 150
        widthButton4.constant = 75
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func button4(_ sender: Any) {
        widthButton1.constant = 75
        widthButton2.constant = 75
        widthButton3.constant = 75
        widthButton4.constant = 150
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
