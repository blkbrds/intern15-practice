//
//  BViewController.swift
//  BaiTap01
//
//  Created by TranVanTien on 11/27/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class BViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupUI() {
        super.setupUI()
        title = "ViewController B"
    }
    
    @IBAction private func nextToViewTouchUpInside(_ sender: Any) {
        let vcC = CViewController()
        navigationController?.pushViewController(vcC, animated: true)
    }
    
    @IBAction private func preToViewTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
