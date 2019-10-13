//
//  Ex41ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/11/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex41ViewController: ExerciseViewController {

  @IBOutlet weak var horizontalView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  @IBAction func choiceDirection(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      horizontalView.isHidden = false
    default:
      horizontalView.isHidden = true
    }
  }
}
