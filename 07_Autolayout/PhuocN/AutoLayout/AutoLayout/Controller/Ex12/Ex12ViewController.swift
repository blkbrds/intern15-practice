//
//  Ex12ViewController.swift
//  AutoLayout
//
//  Created by PhuocNguyen on 10/10/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class Ex12ViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class BorderLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layer.borderWidth = 0.25
    self.layer.borderColor = UIColor.black.cgColor
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.layer.borderWidth = 0.25
    self.layer.borderColor = UIColor.black.cgColor
    //fatalError("init(coder:) has not been implemented")
  }
}
