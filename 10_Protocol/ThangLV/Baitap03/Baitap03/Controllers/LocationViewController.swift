//
//  LocationViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/8/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Location"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(touchUpInsideEditButton))
    }
    
    @objc func touchUpInsideEditButton() {
        let regionViewController = RegionViewController()
        navigationController?.pushViewController(regionViewController, animated: true)
    }
}
