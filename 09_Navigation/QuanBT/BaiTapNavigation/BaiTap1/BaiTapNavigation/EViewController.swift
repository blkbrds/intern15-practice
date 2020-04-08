//
//  EViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class EViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }
    
    // MARK: - IBAction
    @IBAction private func cButtonTouchUpInside(_ sender: Any) {
        if let vcC = (navigationController?.viewControllers[2]) {
            navigationController?.popToViewController(vcC, animated: true)
        }
    }
    
    @IBAction private func bButtonTouchUpInside(_ sender: Any) {
        if let vcB = (navigationController?.viewControllers[1]) {
            navigationController?.popToViewController(vcB, animated: true)
        }
    }
    
    @IBAction private func dButtonTouchUpInside(_ sender: Any) {
        if let vcD = (navigationController?.viewControllers[3]) {
            navigationController?.popToViewController(vcD, animated: true)
        }
    }
    
    @IBAction private func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
