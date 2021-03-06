//
//  DViewController.swift
//  Navigation
//
//  Created by PCI0018 on 10/31/19.
//  Copyright © 2019 Thong Nguyen T. All rights reserved.
//

import UIKit

final class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }

    @IBAction func clickButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            // next vc
            navigationController?.pushViewController(EViewController(), animated: true)
        case 1:
            // go to vc C
            navigationController?.popViewController(animated: true)
        case 2:
            // go to vc B
            guard let naviController = navigationController else { return }
            for vc in naviController.viewControllers {
                if let vc = vc as? BViewController {
                    navigationController?.popToViewController(vc, animated: true)
                    return
                }
            }
        case 3:
            // go to root vc
            guard let naviController = navigationController else { return }
            for vc in naviController.viewControllers {
                if let vc = vc as? Ex1ViewController {
                    navigationController?.popToViewController(vc, animated: true)
                    return
                }
            }
        default:
            break
        }
    }
}
