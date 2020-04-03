//
//  ViewController.swift
//  baiTapDrawing
//
//  Created by ADMIN on 4/1/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let pieChart = CircleView(frame: CGRect(x: 50, y: 150, width: 300, height: 300))
        pieChart.values = [100, 200, 150, 50, 400, 120]
        view.addSubview(pieChart)
        let rect = CharView(frame: CGRect(x: 50, y: 520, width: view.bounds.width - 80, height: 250.0))
        rect.values = [Value(value: 200, color:.systemYellow), Value(value: 150, color:.systemBlue), Value(value: 10, color:.green), Value(value: 50, color: .systemRed), Value(value: 100, color:.label), Value(value: 40, color:.lightGray), Value(value: 70, color:.purple)]
        view.addSubview(rect)
        }
}
