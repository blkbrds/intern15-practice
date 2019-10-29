//
//  SliderView.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 10/17/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol SliderViewDelegate {
    func sliderView(_sliderView: SliderView, ofValue: Int )
}

class SliderView: UIView {
    
    @IBOutlet weak var sliderWhiteImageView: UIImageView!
    @IBOutlet weak var sliderGreyImageView: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func awakeFromNib() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        sliderLabel.addGestureRecognizer(pan)
        
    }
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if sliderLabel.center.y + translation.y >= sliderWhiteImageView.frame.minY
            && sliderLabel.center.y + translation.y <= sliderWhiteImageView.frame.maxY {
            
            sliderLabel.center = CGPoint(x: sliderLabel.center.x, y: sliderLabel.center.y + translation.y)
            
//          sliderGreyImageView.frame.size = CGSize(width: sliderWhiteImageView.frame.width, height: bounds.height - sliderLabel.center.y)
            print(bounds.height, sliderLabel.center.y)
            sender.setTranslation(CGPoint.zero, in: self)
            
//            sliderGreyImageView.frame = CGRect(x: sliderWhiteImageView.frame.minX, y: sliderLabel.center.y, width: sliderWhiteImageView.frame.width , height: sliderWhiteImageView.frame.maxY - sliderLabel.center.y)
            //                   sliderGreyImageView.frame = CGRect(x: sliderWhiteImageView.frame.minX, y: sliderLabel.center.y, width: sliderWhiteImageView.frame.width, height: sliderWhiteImageView.frame.maxY - sliderLabel.center.y)
            
            sliderLabel.text = "\(Int((sliderWhiteImageView.frame.maxY - sliderLabel.center.y) / (sliderWhiteImageView.frame.maxY - sliderWhiteImageView.frame.minY) * 100))%"
        }
    }
    
}
