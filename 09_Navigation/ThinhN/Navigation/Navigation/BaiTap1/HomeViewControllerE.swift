//
//  HomeViewControllerE.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewControllerE: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller E"
    }

    @IBAction func cButtonTouchUpInsine(_ sender: Any) {
        let vcC = (self.navigationController?.viewControllers[2])!
        navigationController?.popToViewController(vcC, animated: true)
    }
    
    @IBAction func bButtonTouchUpInsine(_ sender: Any) {
        let vcB = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(vcB, animated: true)
    }
    
    @IBAction func dButtonTouchUpInsine(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonTouchUpInsine(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
