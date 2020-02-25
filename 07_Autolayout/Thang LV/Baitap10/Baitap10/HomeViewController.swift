//
//  HomeViewController.swift
//  Baitap10
//
//  Created by PCI0008 on 12/26/19.
//  Copyright © 2019 Thang Le. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let content = Bundle.main.loadNibNamed("AutoConstraints", owner: self, options: nil)?[0] as? AutoConstraints
        content?.frame = UIScreen.main.bounds
        view.addSubview(content!)
    }


  

}
