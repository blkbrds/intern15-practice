//
//  BViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller B"
    }

    @IBAction func clickButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            // next vc
            navigationController?.pushViewController(CViewController(), animated: true)
        case 1:
            // previous vc
            navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
}
