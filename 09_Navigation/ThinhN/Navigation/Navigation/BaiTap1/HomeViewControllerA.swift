//
//  HomeViewControllerA.swift
//  Navigation
//
//  Created by PCI0019 on 6/19/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller A"
    }
    
    @IBAction func nextButtonTouchUpInsine(_ sender: Any) {
        let vc = HomeViewControllerB()
        navigationController?.pushViewController(vc, animated: true)
    }
}
