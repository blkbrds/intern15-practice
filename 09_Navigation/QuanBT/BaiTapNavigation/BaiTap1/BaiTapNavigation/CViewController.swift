//
//  CViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class CViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController C"
    }
    
    // MARK: - IBAction
    @IBAction private func nextTouchUpInside(_ sender: Any) {
        let vcD = DViewController()
        self.navigationController?.pushViewController(vcD, animated: true)
    }
    
    @IBAction private func preTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootTouchUpInside(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
