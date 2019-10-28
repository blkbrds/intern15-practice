//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex2ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func moveNext(_ sender: Any) {
        navigationController?.pushViewController(Sub2_1ViewController(), animated: true)
    }
}
