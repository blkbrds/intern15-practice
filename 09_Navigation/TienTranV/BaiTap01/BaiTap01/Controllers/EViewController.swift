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
        for viewcontroller in viewControllers where viewcontroller is CViewController {
            pushViewController(viewController: viewcontroller)
        }
    }

    @IBAction private func popToBTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for viewController in viewControllers where viewController is BViewController {
            pushViewController(viewController: viewController)
        }
    }

    @IBAction private func popToDTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for viewController in viewControllers where viewController is DViewController {
            navigationController?.popToViewController(viewController, animated: true)
        }
    }

    @IBAction private func popToRootViewTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
