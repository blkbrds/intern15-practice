//
//  BadgeNumberViewController.swift
//  CustomView
//
//  Created by PhuocNguyen on 10/7/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BadgeNumberViewController: UIViewController {
  
  let button = BagdeNumberButton()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    button.frame = CGRect(x: 140, y: 100, width: 150, height: 70)
    button.backgroundColor = .systemBlue
    button.text = "123+"
    button.numberBagdePosition = .topRight
    button.layer.cornerRadius = 10
    button.setTitle("Email", for: .normal)
    self.view.addSubview(button)
  }
  
}

