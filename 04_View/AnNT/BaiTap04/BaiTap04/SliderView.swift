//
//  SliderView.swift
//  BaiTap04
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

protocol SliderViewDelegate: class {
    func valueChanged()
}

class SliderView: UIView {

    var colorSlider: UISlider!
    var titleLabel: UILabel!
    var minLabel: UILabel!
    var maxLabel: UILabel!
    weak var delegate: SliderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    private func setupLayout() {
        colorSlider = UISlider()
        colorSlider.minimumValue = 0
        colorSlider.maximumValue = 255
        colorSlider.value = 100
        titleLabel = UILabel()
        titleLabel.text = "colorName"
        self.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorSlider)
        colorSlider.translatesAutoresizingMaskIntoConstraints = false
        minLabel = UILabel()
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        minLabel.text = "\(colorSlider.minimumValue)"
        self.addSubview(minLabel)
        maxLabel = UILabel()
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        maxLabel.text = "\(colorSlider.maximumValue)"
        self.addSubview(maxLabel)

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0][v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": titleLabel!, "v1": colorSlider!]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": minLabel!, "v1": colorSlider!]))

        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: 60),
            titleLabel.centerYAnchor.constraint(equalTo: colorSlider.centerYAnchor),
            minLabel.leadingAnchor.constraint(equalTo: colorSlider.leadingAnchor),
            minLabel.widthAnchor.constraint(equalToConstant: 50),
            minLabel.heightAnchor.constraint(equalToConstant: 30),
            maxLabel.trailingAnchor.constraint(equalTo: colorSlider.trailingAnchor),
            maxLabel.topAnchor.constraint(equalTo: minLabel.topAnchor),
            maxLabel.bottomAnchor.constraint(equalTo: minLabel.bottomAnchor),
            maxLabel.widthAnchor.constraint(equalTo: minLabel.widthAnchor),
            ])
        
        colorSlider.addTarget(self, action: #selector(handleValueChange), for: .valueChanged)
    }
    
    @objc func handleValueChange(_ sender: UISlider){
        delegate?.valueChanged()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
