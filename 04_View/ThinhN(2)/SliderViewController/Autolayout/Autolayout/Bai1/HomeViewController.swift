//
//  HomeViewController.swift
//  Autolayout
//
//  Created by PCI0019 on 6/3/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var showButtonTouchUpInsine: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func push(_ sender: Any) {
        let vc = AutolayoutViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
