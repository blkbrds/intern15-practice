//
//  GradientViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigationBar()
  }

  private func setupNavigationBar() {
    title = "Gradient NavigationBar"
    //navigationController?.navigationBar.barTintColor = .clear
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.gradientColors(colors: [.red, .blue])
    
    view.gradientColors(colors: [.red, .blue])
  }
}

extension UIView {
  func gradientColors(colors: [UIColor]) {
    let gl = CAGradientLayer()
    gl.frame = self.bounds
    gl.colors = colors.map({ $0.cgColor })
    gl.locations = [0.0, 1.0]
    self.layer.addSublayer(gl)
  }
}
