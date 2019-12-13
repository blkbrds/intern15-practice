//
//  Sub3_1ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0018 on 10/22/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class Sub3_1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func move(_ sender: Any) {
        navigationController?.pushViewController(Sub3_2ViewController(), animated: true)
    }
}
