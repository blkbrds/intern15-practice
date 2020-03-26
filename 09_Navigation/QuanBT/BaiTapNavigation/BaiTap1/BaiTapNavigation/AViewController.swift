//
//  AViewController.swift
//  BaiTapNavigation
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
    }

     // MARK: - IBAction
    @IBAction private func NextTouchUpInside(_ sender: Any) {
        let vc = BViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
