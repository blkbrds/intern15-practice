//
//  DistrictViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/8/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class DistrictViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "District"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTouchUpInside))
    }
    
    @objc func doneButtonTouchUpInside() {
        navigationController?.popToRootViewController(animated: true)   
    }
}
