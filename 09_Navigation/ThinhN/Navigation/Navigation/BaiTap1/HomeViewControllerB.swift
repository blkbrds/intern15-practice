//
//  HomeViewControllerB.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller B"
    }
   
    @IBAction func nextButtonTouchUpInsine(_ sender: Any) {
        let vc = HomeViewControllerC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func preButtonTouchUpInsine(_ sender: Any) {
        let vc = HomeViewControllerA()
        navigationController?.popViewController(animated: true)
    }
}
