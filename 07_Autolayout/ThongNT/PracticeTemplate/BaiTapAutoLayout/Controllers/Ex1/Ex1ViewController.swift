//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex1ViewController: BaseViewController {
    
    var exercise: Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func moveNext(_ sender: Any) {
        navigationController?.pushViewController(Sub1ViewController(), animated: true)
    }
}
