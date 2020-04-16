//
//  bai10ViewController.swift
//  AutoLayout
//
//  Created by ADMIN on 4/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class bai10ViewController: UIViewController {

    
    @IBOutlet weak var button1widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var button2widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var button3widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var button4widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickButton1(_ sender: Any) {
        button1widthConstraint.constant = 160
        button2widthConstraint.constant = 80
        button3widthConstraint.constant = 80
        button4widthConstraint.constant = 80
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func clickButton2(_ sender: Any) {
        button1widthConstraint.constant = 80
        button2widthConstraint.constant = 160
        button3widthConstraint.constant = 80
        button4widthConstraint.constant = 80
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func clickButton3(_ sender: Any) {
        button1widthConstraint.constant = 80
        button2widthConstraint.constant = 80
        button3widthConstraint.constant = 160
        button4widthConstraint.constant = 80
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func clickButton4(_ sender: Any) {
        button1widthConstraint.constant = 80
        button2widthConstraint.constant = 80
        button3widthConstraint.constant = 80
        button4widthConstraint.constant = 160
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
