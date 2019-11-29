//
//  CViewController.swift
//  BaiTap01
//
//  Created by TranVanTien on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class CViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "ViewController C"
    }
    
    @IBAction private func nextToViewTouchUpInside(_ sender: Any) {
        let vcD = DViewController()
        navigationController?.pushViewController(vcD, animated: true)
    }

    @IBAction private func preToViewTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func popToRootViewTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
