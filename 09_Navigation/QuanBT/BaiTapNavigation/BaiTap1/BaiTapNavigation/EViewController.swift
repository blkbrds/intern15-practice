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
    @IBAction private func cTouchUpInside(_ sender: Any) {
        let vcC = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vcC, animated: true)
    }
    
    @IBAction private func bTouchUpInside(_ sender: Any) {
        let vcB = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vcB, animated: true)
    }
    @IBAction private func dTouchUpInside(_ sender: Any) {
        let vcD = (self.navigationController?.viewControllers[3])!
        self.navigationController?.popToViewController(vcD, animated: true)
    }
    @IBAction private func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
