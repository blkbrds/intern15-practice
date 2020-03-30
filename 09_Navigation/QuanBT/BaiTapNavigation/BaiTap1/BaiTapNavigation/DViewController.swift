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
    @IBAction private func nextTouchUpInside(_ sender: Any) {
        let vcE = EViewController()
        self.navigationController?.pushViewController(vcE, animated: true)
    }
    
    @IBAction private func cTouchUpInside(_ sender: Any) {
        let vcC = (self.navigationController?.viewControllers[2])!
        self.navigationController?.popToViewController(vcC, animated: true)
    }
    
    @IBAction private func bTouchUpInside(_ sender: Any) {
        let vcB = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vcB, animated: true)
    }
    @IBAction private func RootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
