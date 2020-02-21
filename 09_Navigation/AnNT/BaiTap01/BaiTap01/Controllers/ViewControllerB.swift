//
//  ViewControllerB.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "ViewController B"
  }

  @IBAction func nextButton(_ sender: Any) {
    let viewControllerC = ViewControllerC()
    navigationController?.pushViewController(viewControllerC, animated: true)
  }

  @IBAction func preButton(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
