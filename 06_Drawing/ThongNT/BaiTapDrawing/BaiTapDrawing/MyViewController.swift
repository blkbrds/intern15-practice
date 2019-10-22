//
//  MyViewController.swift
//  BaiTapDrawing
//
//  Created by PCI0018 on 10/21/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class MyViewController: UIViewController {

    private let values: [CGFloat] = [34, 100, 67, 80, 90, 34, 50]

    override func viewDidLoad() {
        super.viewDidLoad()

        let columnChartView = ColumnChartView()
        let frameTop = CGRect(x: 20, y: 30, width: view.bounds.width, height: view.bounds.height / 2 - 30)
        columnChartView.frame = frameTop
        columnChartView.backgroundColor = .white
        columnChartView.transform(values: values)
        
        let pieChartView = PieChartView()
        let frameBottom = CGRect(x: 20, y: view.bounds.height / 2 + 30, width: view.bounds.width, height: view.bounds.height / 2 - 30)
        pieChartView.frame = frameBottom
        pieChartView.backgroundColor = .white
        pieChartView.transform(values: values)
        
        view.addSubview(columnChartView)
        view.addSubview(pieChartView)
        view.backgroundColor = .systemGray4
    }
}
