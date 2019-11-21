//
//  HomeViewController.swift
//  CollectionViewAdvance
//
//  Created by PCI0018 on 11/15/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private functions
    private func setupUI() {
        title = "Custom Header"
    }
}
