//
//  View2ViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class View2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 2"
    }
    
    @IBAction func pushToNextView() {
        let vc = View3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func popToPreView() {
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRootView() {
        navigationController?.popToRootViewController(animated: true)
    }
}
