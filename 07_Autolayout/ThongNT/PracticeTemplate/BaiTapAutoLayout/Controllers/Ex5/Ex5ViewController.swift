//
//  Ex5ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0018 on 10/23/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class Ex5ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveTo5(_ sender: Any) {
        navigationController?.pushViewController(Sub5_ViewController(), animated: true)
    }
    
    @IBAction func moveTo5_1(_ sender: Any) {
        navigationController?.pushViewController(Sub5_1ViewController(), animated: true)
    }
    
    @IBAction func moveTo5_2(_ sender: Any) {
        navigationController?.pushViewController(Sub5_2ViewController(), animated: true)
    }
    
    @IBAction func moveTo5_3(_ sender: Any) {
        navigationController?.pushViewController(Sub5_3ViewController(), animated: true)
    }
    
    @IBAction func moveTo5_4(_ sender: Any) {
        navigationController?.pushViewController(Sub5_4ViewController(), animated: true)
    }
}
