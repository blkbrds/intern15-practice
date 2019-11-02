//
//  Ex7ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex7ViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  @IBAction func choiceExercise(_ sender: UIButton) {
      switch sender.tag {
      case 0:
          let vc = Ex7_1ViewController()
          navigationController?.pushViewController(vc, animated: true)
      case 1:
          let vc = Ex7_2ViewController()
          navigationController?.pushViewController(vc, animated: true)
      case 2:
          let vc = Ex7_3ViewController()
          navigationController?.pushViewController(vc, animated: true)
      case 3:
          let vc = Ex7_4ViewController()
          navigationController?.pushViewController(vc, animated: true)
      case 4:
          let vc = Ex7_5ViewController()
          navigationController?.pushViewController(vc, animated: true)
      default:
          break
      }
  }
}
