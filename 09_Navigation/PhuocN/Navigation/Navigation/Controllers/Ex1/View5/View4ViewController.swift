//
//  View5ViewController.swift
//  Navigation
//
//  Created by PhuocNguyen on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class View4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View 4"
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
    
    @IBAction private func popToView2TouchUpInside() {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? View2ViewController {
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }
}
