//
//  DViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/2/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller D"
    }

    @IBAction private func handleNextButtonTouchUpInside(_ sender: Any) {
        let eViewController = EViewController()
        navigationController?.pushViewController(eViewController, animated: true)
    }
    
    @IBAction private func handleCButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func handleBButtonTouchUpInside(_ sender: Any) {
        guard let viewControllers = navigationController?.viewControllers else { return }
        for viewController in viewControllers {
            if viewController is BViewController {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction private func handleRootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
