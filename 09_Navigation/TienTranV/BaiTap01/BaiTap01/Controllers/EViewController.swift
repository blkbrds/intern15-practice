//
//  EViewController.swift
//  BaiTap01
//
//  Created by TranVanTien on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class EViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "ViewController E"
    }
    
    @IBAction private func popToCTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for vc in viewControllers where vc is CViewController {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    @IBAction private func popToBTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for vc in viewControllers where vc is BViewController {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    @IBAction private func popToDTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for vc in viewControllers where vc is DViewController {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    @IBAction private func popToRootViewTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
