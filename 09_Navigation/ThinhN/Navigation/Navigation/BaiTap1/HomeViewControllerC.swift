//
//  HomeViewControllerC.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller C"
      
        
    }

    @IBAction func nextButtonTouchUpInsine(_ sender: Any) {
        let vc = HomeViewControllerD()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func preButtonTouchUpInsine(_ sender: Any) {
        let vc = HomeViewControllerB()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonTouchUpInsine(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
