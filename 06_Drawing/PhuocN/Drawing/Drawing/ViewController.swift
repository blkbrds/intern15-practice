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
    let pieChartView = PieChartView()
    pieChartView.frame = CGRect(x: 0, y: 100, width: 400, height: 200)
    pieChartView.backgroundColor = .clear
    pieChartView.pies = [Pie(value: 60, color: .blue, radius: 60),
                    Pie(value: 70, color: .green, radius: 80),
                    Pie(value: 20, color: .red, radius: 70),
                    Pie(value: 120, color: .orange, radius: 55)]
    self.view.addSubview(pieChartView)
    let lineChartView = LineChartView()
    lineChartView.frame = CGRect(x: 0, y: 400, width: 400, height: 300)
    lineChartView.backgroundColor = .clear
    lineChartView.lines = [0,24,23,50,60]
    lineChartView.thumbRadius = 10
    lineChartView.thumbColor = .red
    lineChartView.lineWidth = 5
    self.view.addSubview(lineChartView)
  }
}
