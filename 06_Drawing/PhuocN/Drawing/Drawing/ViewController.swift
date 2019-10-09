//
//  ViewController.swift
//  Drawing
//
//  Created by PhuocNguyen on 10/8/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .secondarySystemGroupedBackground
    //let view = LineChartView()
    let view = PieChartView()
    view.frame = CGRect(x: 0, y: 0, width: 400, height: 200)
    view.center = self.view.center
    view.backgroundColor = .clear
    //    view.lines = [0,24,23,50,60]
    //    view.thumbRadius = 10
    //    view.thumbColor = .red
    //    view.lineWidth = 5
    view.pies = [Pie(value: 60, color: .blue, radius: 60),
                 Pie(value: 70, color: .green, radius: 80),
                 Pie(value: 20, color: .red, radius: 70),
                 Pie(value: 120, color: .orange, radius: 55)]
    self.view.addSubview(view)
  }
}
