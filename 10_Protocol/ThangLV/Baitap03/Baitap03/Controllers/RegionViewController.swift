//
//  RegionViewController.swift
//  Baitap03
//
//  Created by PCI0008 on 1/8/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Region"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Province", style: .plain, target: self, action: #selector(touchUpInsideProvinceButton))
    }
    
    @objc func touchUpInsideProvinceButton() {
        let provinceViewController = ProvinceViewController()
        navigationController?.pushViewController(provinceViewController, animated: true)
    }
}
