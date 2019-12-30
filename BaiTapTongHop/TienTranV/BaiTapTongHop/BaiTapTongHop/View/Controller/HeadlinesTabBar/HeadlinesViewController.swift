//
//  HeadlinesViewController.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 12/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class HeadlinesViewController: BaseViewController {
    
    @IBOutlet weak var s: UISegmentedControl!
    override func setupUI() {
        super.setupUI()
        title = "Headlines"
    }
}
