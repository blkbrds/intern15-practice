//
//  ViewControllerC.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "ViewController C"
  }

  @IBAction func nextButton(_ sender: Any) {
    let viewControllerD = ViewControllerD()
    navigationController?.pushViewController(viewControllerD, animated: true)
  }

  @IBAction func preButton(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func rootButton(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
}
