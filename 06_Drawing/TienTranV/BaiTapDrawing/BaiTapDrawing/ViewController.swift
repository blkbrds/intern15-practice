//
//  ViewController.swift
//  ExampleDrawing
//
//  Created by PCI0002 on 11/19/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Ve hinh tron
        let rec = CircleView(frame: CGRect(x: 20.0, y: 50.0, width: view.bounds.width - 80, height: 250.0))
        // Xet gia tri cho tung part cua hinh tron
        rec.values = [30, 60, 90, 60, 120, 90, 50]
        view.addSubview(rec)

        // Ve bieu do
        let rect = ChartView(frame: CGRect(x: 20.0, y: 320, width: view.bounds.width - 80, height: 250.0))
        rect.values = [Values(value: 200, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Values(value: 150, color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Values(value: 300, color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), Values(value: 50, color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), Values(value: 150, color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Values(value: 450, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Values(value: 40, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))]
        view.addSubview(rect)
    }
}

