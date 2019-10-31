//
//  EViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class EViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View controller E"
    }

    @IBAction func clickButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            // go to vc C
            if let viewControllerC = navigationController?.viewControllers[3] {
                navigationController?.popToViewController(viewControllerC, animated: true)
            }
        case 1:
            // go to vc B
            if let viewControllerB = navigationController?.viewControllers[2] {
                navigationController?.popToViewController(viewControllerB, animated: true)
            }
        case 2:
            // go to vc D
            navigationController?.popViewController(animated: true)
        case 3:
            // go to root
            if let viewControllerA = navigationController?.viewControllers[1] {
                navigationController?.popToViewController(viewControllerA, animated: true)
            }
        default:
            break
        }
    }
}
