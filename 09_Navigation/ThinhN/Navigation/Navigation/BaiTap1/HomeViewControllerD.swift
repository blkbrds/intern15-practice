//
//  HomeViewControllerD.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewControllerD: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }

    @IBAction func nextButtonTouchUpInsine(_ sender: Any) {
        let vc = HomeViewControllerE()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cButtonTouchUpInsine(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bButtonTouchUpInsine(_ sender: Any) {
        let vcB = (self.navigationController?.viewControllers[1])!
        navigationController?.popToViewController(vcB, animated: true)
    }
    
    @IBAction func rootButtonTouchUpInsine(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
