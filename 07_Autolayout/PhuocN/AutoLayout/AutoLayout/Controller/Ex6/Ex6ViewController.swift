//
//  Ex6ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex6ViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func choiceExercise(_ sender: UIButton) {
    switch sender.tag {
    case 0:
        let vc = Ex61ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 1:
        let vc = Ex62ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 2:
        let vc = Ex63ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 3:
        let vc = Ex64ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 4:
        let vc = Ex65ViewController()
        navigationController?.pushViewController(vc, animated: true)
    default:
        break
    }
  }
}
