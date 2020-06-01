//
//  SliderView2Controller.swift
//  SliderViewController
//
//  Created by PCI0019 on 6/1/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderView2Controller: UIViewController {

    @IBOutlet weak var whiteSliderView: UIView!
    @IBOutlet weak var thumbnailSliderLabel: UILabel!
    @IBOutlet weak var blueSliderView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteSliderView.layer.borderWidth = 1
        whiteSliderView.clipsToBounds = true
        thumbnailSliderLabel.layer.cornerRadius = 20
        
    }
    

    
}
