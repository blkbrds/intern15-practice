//
//  Ex5ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex5ViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  @IBAction func choiceExercise(_ sender: UIButton) {
    switch sender.tag {
    case 0:
        let vc = Ex51ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 1:
        let vc = Ex52ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 2:
        let vc = Ex53ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 3:
        let vc = Ex54ViewController()
        navigationController?.pushViewController(vc, animated: true)
    case 4:
        let vc = Ex55ViewController()
        navigationController?.pushViewController(vc, animated: true)
    default:
        break
    }
  }
}
