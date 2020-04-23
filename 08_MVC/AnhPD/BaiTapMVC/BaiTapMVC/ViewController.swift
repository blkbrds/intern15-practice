//
//  ViewController.swift
//  BaiTapMVC
//
//  Created by PCI0012 on 4/17/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var luu = SaveData()
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func numbersButtonTouchUpInSide(_ sender: UIButton) {
        textField.text = String(luu.addNumber(number: Float(sender.tag)))
    }
    
    @IBAction func selectionsButtonTouchUpInSide(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            textField.text = "+"
        case 11:
            textField.text = "-"
        case 12:
            textField.text = "x"
        default:
            textField.text = "/"
        }
    }
    
    @IBAction func resultButtonTouchUpInSide(_ sender: Any) {
        
    }
}
