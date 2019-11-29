//
//  BaseViewController.swift
//  BaiTap01
//
//  Created by PCI0002 on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: setup Data & UI
    func setupData() {
    }
    
    func setupUI() {
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: #imageLiteral(resourceName: "leftBarItem"), style: .plain, target: self, action: #selector(popToView))]
    }

    @objc private func popToView() {
        navigationController?.popViewController(animated: true)
    }
}
