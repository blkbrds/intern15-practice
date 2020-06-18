//
//  bai10ViewController.swift
//  AutoLayout
//
//  Created by ADMIN on 4/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class Bai10ViewController: UIViewController {

    @IBOutlet private weak var button1WidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var button2WidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var button3WidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var button4WidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func button1TouchUpInsine(_ sender: Any) {
        button1WidthConstraint.constant = 160
        button2WidthConstraint.constant = 80
        button3WidthConstraint.constant = 80
        button4WidthConstraint.constant = 80
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func button2TouchUpInsine(_ sender: Any) {
        button1WidthConstraint.constant = 80
        button2WidthConstraint.constant = 160
        button3WidthConstraint.constant = 80
        button4WidthConstraint.constant = 80
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func button3TouchUpInsine(_ sender: Any) {
        button1WidthConstraint.constant = 80
        button2WidthConstraint.constant = 80
        button3WidthConstraint.constant = 160
        button4WidthConstraint.constant = 80
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func button4TouchUpInsine(_ sender: Any) {
        button1WidthConstraint.constant = 80
        button2WidthConstraint.constant = 80
        button3WidthConstraint.constant = 80
        button4WidthConstraint.constant = 160
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
