//
//  ProvinceViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/8/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class ProvinceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Province"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(districtButtonTouchUpInside))
    }
    
    @objc func districtButtonTouchUpInside() {
        let districtViewController = DistrictViewController()
        navigationController?.pushViewController(districtViewController, animated: true)
    }
}
