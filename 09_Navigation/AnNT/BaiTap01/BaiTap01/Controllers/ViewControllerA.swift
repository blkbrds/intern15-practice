//
//  ViewControllerA.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "ViewController A"

  }

  @IBAction func nextButton(_ sender: Any) {
    let viewControllerB = ViewControllerB()
    navigationController?.pushViewController(viewControllerB, animated: true)
  }
}
