//
//  LocationViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        setupView()
        
    }
    func setupView() {
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
        
    }
    @objc func editButtonTouchUpInside() {
        let vc = AreaViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
