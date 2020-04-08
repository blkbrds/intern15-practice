//
//  BViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class BViewController: UIViewController {
     // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }
    
    // MARK: - IBAction
    @IBAction private func preButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func nextButtonTouchUpInside(_ sender: Any) {
        let vcC = CViewController()
        navigationController?.pushViewController(vcC, animated: true)
    }
}
