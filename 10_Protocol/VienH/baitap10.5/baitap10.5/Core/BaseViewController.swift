//
//  BaseViewController.swift
//  baitap10.5
//
//  Created by user on 12/17/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : setup Data & UI
    func setupData() {}
    
    func setupUI() {}
    
    func updateUI() { }
}
