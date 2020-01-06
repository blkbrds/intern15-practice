//
//  ViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 12/28/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var chartViewCustom: ChartViewCustom!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        chartViewCustom.value += 10
        if chartViewCustom.value > 100 {
            chartViewCustom.value = 0
        }
    }
    
    private func setupUI() {
        chartViewCustom = ChartViewCustom(frame: CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height / 2 - 150, width: 300, height: 300))
        view.addSubview(chartViewCustom)
    }
}

