//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex3ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func move(_ sender: Any) {
        navigationController?.pushViewController(Sub3_1ViewController(), animated: true)
    }
}
