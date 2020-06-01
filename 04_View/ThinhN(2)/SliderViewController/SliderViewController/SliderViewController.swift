//
//  SliderViewController.swift
//  SliderViewController
//
//  Created by PCI0019 on 5/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let sliderView = SliderView(frame: CGRect(x: 150, y: 150, width: 20, height: 500))
        view.addSubview(sliderView)
    }
   
}
