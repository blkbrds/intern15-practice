//
//  ViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/27/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var chartViewCustom: ChartViewCustom!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }
    
    private func setupUI(){
        chartViewCustom = ChartViewCustom(frame: view.bounds)
        chartViewCustom.backgroundColor = .white
        view.addSubview(chartViewCustom)
    }
}

