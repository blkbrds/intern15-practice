//
//  ViewControllerE.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ViewControllerE: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "ViewController E"
  }

  @IBAction func cButton(_ sender: Any) {
    guard let viewControllers = self.navigationController?.viewControllers else { return }
    for vc in  viewControllers {
      if vc is ViewControllerC {
        navigationController?.popToViewController(vc, animated: true)
      }
    }
  }

  @IBAction func bButton(_ sender: Any) {
    guard let viewControllers = self.navigationController?.viewControllers else { return }
    for vc in  viewControllers {
      if vc is ViewControllerB {
        navigationController?.popToViewController(vc, animated: true)
      }
    }
  }

  @IBAction func dButton(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func rootButton(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
}
