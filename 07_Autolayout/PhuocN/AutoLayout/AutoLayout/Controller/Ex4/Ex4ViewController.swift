//
//  Ex4ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/9/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex4ViewController: ExerciseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func choiceExercise(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let vc = Ex41ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = Ex42ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = Ex43ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = Ex44ViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = Ex45ViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
