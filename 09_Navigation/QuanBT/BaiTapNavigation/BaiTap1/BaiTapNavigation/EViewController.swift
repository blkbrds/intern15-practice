//
//  EViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class EViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
    }

    // MARK: - IBAction
    @IBAction private func cTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction private func bTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    @IBAction private func dTouchUpInside(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[3])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    @IBAction private func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
