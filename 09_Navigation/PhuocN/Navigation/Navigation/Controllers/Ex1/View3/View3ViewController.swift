//
//  View4ViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class View3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 3"
    }
    
    @IBAction private func pushToNextViewTouchUpInside() {
        let vc = View4ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func popToPreViewTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func popToRootViewTouchUpInside() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func popToView1TouchUpInside() {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? View1ViewController {
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }
}
