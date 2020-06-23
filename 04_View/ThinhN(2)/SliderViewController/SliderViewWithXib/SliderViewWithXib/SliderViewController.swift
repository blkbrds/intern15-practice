//
//  SliderViewController.swift
//  SliderViewWithXib
//
//  Created by PCI0019 on 6/2/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)? [0] as? SliderView {
            sliderView.frame = CGRect(x: 150, y: 150, width: 40, height: 500)
            view.addSubview(sliderView)
        }
    }
}
