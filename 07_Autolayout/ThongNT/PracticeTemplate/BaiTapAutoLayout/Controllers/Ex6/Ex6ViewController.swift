//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex6ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func move(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            navigationController?.pushViewController(Sub6_ViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(Sub6_1ViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(Sub6_2ViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(Sub6_3ViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(Sub6_4ViewController(), animated: true)
        default:
            break
        }
    }
}
