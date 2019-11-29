//
//  DViewController.swift
//  BaiTap01
//
//  Created by TranVanTien on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class DViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "ViewController D"
    }

    @IBAction private func nextToViewTouchUpInside(_ sender: Any) {
        let vcE = EViewController()
        navigationController?.pushViewController(vcE, animated: true)
    }

    @IBAction private func popToViewControllerCTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for vc in viewControllers where vc is CViewController {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    @IBAction private func popToViewControllerBTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        for vc in viewControllers where vc is BViewController {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    @IBAction private func popToRootViewTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
