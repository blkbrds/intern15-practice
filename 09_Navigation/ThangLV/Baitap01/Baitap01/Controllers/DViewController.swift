//
//  DViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/2/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }

    
    @IBAction func handleNextButtonTouchUpInside(_ sender: Any) {
        let eViewController = EViewController()
        navigationController?.pushViewController(eViewController, animated: true)
    }
    
    @IBAction func handleCButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleBButtonTouchUpInside(_ sender: Any) {
        for viewController in (navigationController?.viewControllers)! {
            if viewController is BViewController {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func handleRootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
