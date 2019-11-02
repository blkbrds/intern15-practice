//
//  View2ViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class View2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 2"
    }
    
    @IBAction private func pushToNextViewTouchUpInside() {
        let vc = View3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func popToPreViewTouchUpInside() {
         navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func popToRootViewTouchUpInside() {
        navigationController?.popToRootViewController(animated: true)
    }
}
