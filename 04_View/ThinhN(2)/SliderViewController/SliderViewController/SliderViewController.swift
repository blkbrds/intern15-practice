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
    let whiteSliderView = UIView(frame: CGRect(x: 150, y: 150, width: 20, height: 500))
        whiteSliderView.backgroundColor = .white
        whiteSliderView.layer.borderWidth = 1
        view.addSubview(whiteSliderView)
    let blueSliderView = UIView(frame: CGRect(x: 150, y: 400, width: 20, height: 250))
        blueSliderView.backgroundColor = .systemBlue
        view.addSubview(blueSliderView)
    let thumbnailView = UIView(frame: CGRect(x: 140, y: 390, width: 40, height: 40))
        thumbnailView.backgroundColor = .orange
        thumbnailView.layer.cornerRadius = 20
        let thumbnailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        thumbnailLabel.text = "50"
        thumbnailLabel.textAlignment = .center
        thumbnailLabel.textColor = .white
        thumbnailLabel.font = .systemFont(ofSize: 10)
        thumbnailView.addSubview(thumbnailLabel)
        view.addSubview(thumbnailView)
        let slideGesture = UIGestureRecognizer(target: self, action: #selector(self.sliderGesture(_:)))
        thumbnailLabel.addGestureRecognizer(slideGesture)
        
    }
    @objc func sliderGesture(_ sender: UITapGestureRecognizer) {
        print("aaa")
    }
            
}
