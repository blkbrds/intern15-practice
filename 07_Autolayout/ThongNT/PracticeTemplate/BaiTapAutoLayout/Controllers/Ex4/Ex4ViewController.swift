//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex4ViewController: BaseViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeSection(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            navigationController?.pushViewController(Ex4ViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(Sub4_1ViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(Sub4_2ViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(Sub4_3ViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(Sub4_4ViewController(), animated: true)
        default:
            break
        }
    }
}
