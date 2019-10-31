//
//  CViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View controller C"
    }

    @IBAction func clickButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            // next vc
            navigationController?.pushViewController(DViewController(), animated: true)
        case 1:
            //previous vc
            navigationController?.popViewController(animated: true)
        case 2:
            // go to root vc
            if let viewControllerA = navigationController?.viewControllers[1] {
                navigationController?.popToViewController(viewControllerA, animated: true)
            }
        default:
            break
        }
    }
}
