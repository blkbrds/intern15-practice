//
//  ColorVC.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {
    
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let colorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.gray.cgColor
        v.layer.borderWidth = 1.0
        return v
    }()
    
    let redSlider: SliderView = {
        let slider = SliderView()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.colorSlider.thumbTintColor = .red
        slider.tintColor = .red
        slider.titleLabel.text = "Red"
        return slider
    }()
    
    let greenSlider: SliderView = {
        let slider = SliderView()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.colorSlider.thumbTintColor = .green
        slider.tintColor = .green
        slider.titleLabel.text = "Green"
        return slider
    }()
    
    let blueSlider: SliderView = {
        let slider = SliderView()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.colorSlider.thumbTintColor = .blue
        slider.tintColor = .blue
        slider.titleLabel.text = "Blue"
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        redSlider.delegate = self
        greenSlider.delegate = self
        blueSlider.delegate = self
    }
    
    func setupUI(){
        view.addSubview(colorLabel)
        view.addSubview(colorView)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        
        let views = ["v0": colorLabel, "v1": colorView, "v2": redSlider, "v3": greenSlider, "v4": blueSlider]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": colorLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-44-[v0]-30-[v1]-30-[v2]-5-[v3]-5-[v4]-30-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views ))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": redSlider]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": greenSlider]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": blueSlider]))
        NSLayoutConstraint.activate([
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            redSlider.heightAnchor.constraint(equalToConstant: 50),
            greenSlider.heightAnchor.constraint(equalToConstant: 50),
            blueSlider.heightAnchor.constraint(equalToConstant: 50),
        ])
        valueChanged()
    }
}

extension ColorVC: SliderViewDelegate {
    func valueChanged() {
        let red = redSlider.colorSlider.value
        let green = greenSlider.colorSlider.value
        let blue = blueSlider.colorSlider.value
        colorView.backgroundColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
        colorLabel.text = "r: \(Int(red)), g: \(Int(green)), b: \(Int(blue))"
    }
}
