//
//  ViewControllerD.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewControllerD: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "ViewController D"
  }

  @IBAction func nextButton(_ sender: Any) {
    let viewControllerE = ViewControllerE()
    navigationController?.pushViewController(viewControllerE, animated: true)
  }

  @IBAction func bButton(_ sender: Any) {
    guard let viewControllers = self.navigationController?.viewControllers else { return }
    for vc in  viewControllers {
      if vc is ViewControllerB {
        navigationController?.popToViewController(vc, animated: true)
      }
    }
  }

  @IBAction func cButton(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func rootButton(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
}
