//
//  CViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/2/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller C"
    }
    
    
    @IBAction func handleNextButtonTouchUpInside(_ sender: Any) {
        let dViewController = DViewController()
        navigationController?.pushViewController(dViewController, animated: true)
    }
    
    
    @IBAction func handlePrevButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func handleRootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
