//
//  ViewController.swift
//  BaiTap01
//
//  Created by ANH NGUYỄN on 10/20/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ChartViewController: chartViewDelegate1 {
    func chartView(_chartView: ChartView, didSect index: Int) {
        print("hihi \(index).")
    }
    
}
