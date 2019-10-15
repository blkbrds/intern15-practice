//
//  View1ViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class View1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 1"
    }
    
    @IBAction func pushToNextView() {
        let vc = View2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func popToRootView() {
        navigationController?.popToRootViewController(animated: true)
    }
}
