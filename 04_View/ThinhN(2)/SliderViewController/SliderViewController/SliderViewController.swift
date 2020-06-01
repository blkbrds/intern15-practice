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
        let sliderView = SliderView()
        sliderView.setUpThumbnailView()
//        let sliderView = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil) ? [0] as? sliderView
        view.addSubview(sliderView)
    }
   
}
