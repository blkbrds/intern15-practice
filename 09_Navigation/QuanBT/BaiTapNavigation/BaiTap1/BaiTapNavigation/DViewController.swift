//
//  DViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class DViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController D"
    }
    
    // MARK: - IBAction
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let vcE = EViewController()
        navigationController?.pushViewController(vcE, animated: true)
    }
    
    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        if let vcC = navigationController?.viewControllers[2] {
            navigationController?.popToViewController(vcC, animated: true)
        }
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        if let vcB = (navigationController?.viewControllers[1]) {
            navigationController?.popToViewController(vcB, animated: true)
        }
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
