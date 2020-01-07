//
//  CViewController.swift
//  Baitap01
//
//  Created by PCI0008 on 1/2/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Controller C"
    }
    
    @IBAction private func handleNextButtonTouchUpInside(_ sender: Any) {
        let dViewController = DViewController()
        navigationController?.pushViewController(dViewController, animated: true)
    }
    
    @IBAction private func handlePrevButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func handleRootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
