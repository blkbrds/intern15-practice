//
//  ChartViewController.swift
//  baiTapDrawing(2)
//
//  Created by ADMIN on 4/26/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    let chartView = ChartView()
    view.backgroundColor = .white
    chartView.draw()
    chartView.labelView()
    view.addSubview(chartView)
    }
}
