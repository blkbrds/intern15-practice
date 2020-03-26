//
//  BViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
     // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
    }
    
    // MARK: - IBAction
    @IBAction private func preTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func nextTouchUpInside(_ sender: Any) {
        let vc = CViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
