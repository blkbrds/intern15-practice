//
//  BViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/2/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller B"
    }
    
    
    @IBAction func handleNextButtonTouchUpInside(_ sender: Any) {
        let cViewController = CViewController()
        navigationController?.pushViewController(cViewController, animated: true)
    }
    
    
    @IBAction func handlePrevButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
