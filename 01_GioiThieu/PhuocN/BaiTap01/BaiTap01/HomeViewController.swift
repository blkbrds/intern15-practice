//
//  HomeViewController.swift
//  BaiTap01
//
//  Created by PhuocNguyen on 9/30/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var colors : [UIColor] = [.black,.blue,.red,.brown,.green,.yellow]
  @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      btn.clipsToBounds = true
      btn.layer.cornerRadius = 10
      btn.backgroundColor = .lightGray
    }

  @IBAction func handleBtn(_ sender: Any) {
    let randomColor = arc4random_uniform(6)
    self.view.backgroundColor = colors[Int(randomColor)]
  }
  
}
