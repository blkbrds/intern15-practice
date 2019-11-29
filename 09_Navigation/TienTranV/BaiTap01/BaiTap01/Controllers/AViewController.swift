//
//  AViewController.swift
//  BaiTap01
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class AViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "ViewController A"
        navigationItem.leftBarButtonItems = []
    }
    
    @IBAction private func nextToATouchUpInside(_ sender: Any) {
        let vcB =  BViewController()
        navigationController?.pushViewController(vcB, animated: true)
    }
}
