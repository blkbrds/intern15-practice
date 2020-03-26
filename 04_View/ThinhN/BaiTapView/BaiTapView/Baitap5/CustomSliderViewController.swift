//
//  CustomSliderViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/23/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class CustomSliderViewController: UIViewController {
    
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet private weak var whiteView: UIView!
    @IBOutlet weak var thumbValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSliderView(view: sliderView)
        setUpSliderView(view: whiteView)
        setUpThumb()
        if view.tag == 1 {
        view.frame = CGRect(x: 0, y: 0, width: sliderView.frame.width, height: sliderView.frame.midY)
        }
    }

   private func setUpSliderView(view: UIView){
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func setUpThumb(){
        thumbValueLabel.text = "50%"
        thumbValueLabel.layer.borderWidth = 1
        thumbValueLabel.layer.borderColor = UIColor.systemOrange.cgColor
        thumbValueLabel.layer.cornerRadius = thumbValueLabel.frame.size.width
         / 2
        thumbValueLabel.clipsToBounds = true
    
        thumbValueLabel.center = CGPoint(x: sliderView.frame.midX, y: sliderView.frame.midY)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
       if let touch = touches.first {
            let position = touch.location(in: self.view)
            if position.x >= thumbValueLabel.frame.minX,
                position.x <= thumbValueLabel.frame.maxX,
                position.y >= thumbValueLabel.frame.minY,
                position.y <= thumbValueLabel.frame.maxY,
                position.y >= sliderView.frame.minY,
                position.y <= sliderView.frame.maxY {

                thumbValueLabel.center = CGPoint(x: sliderView.center.x, y: position.y)

                whiteView.frame = CGRect(x: 0, y: 0, width: sliderView.frame.width, height: thumbValueLabel.center.y - sliderView.frame.origin.y)

                let percentSlider = 100 * (1 - whiteView.frame.height / sliderView.frame.height)

                thumbValueLabel.text = "\(Int(percentSlider))%"
            }
        }
    }
}
