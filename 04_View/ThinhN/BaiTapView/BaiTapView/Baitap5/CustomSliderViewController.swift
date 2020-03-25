//
//  CustomSliderViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/23/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class CustomSliderViewController: UIViewController {
    
    @IBOutlet weak var SliderView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var thumbValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSliderView(view: SliderView)
        setUpSliderView(view: whiteView)
        setUpThumb()
        if view.tag == 1 {
        view.frame = CGRect(x: 0, y: 0, width: SliderView.frame.width, height: SliderView.frame.midY)
        }
    }

   private func setUpSliderView(view: UIView){
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func setUpThumb(){
        thumbValue.text = "50%"
        thumbValue.layer.borderWidth = 1
        thumbValue.layer.borderColor = UIColor.systemOrange.cgColor
        thumbValue.layer.cornerRadius = thumbValue.frame.size.width
         / 2
        thumbValue.clipsToBounds = true
    
        thumbValue.center = CGPoint(x: SliderView.frame.midX, y: SliderView.frame.midY)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
       if let touch = touches.first {
            let position = touch.location(in: self.view)
            if position.x >= thumbValue.frame.minX,
                position.x <= thumbValue.frame.maxX,
                position.y >= thumbValue.frame.minY,
                position.y <= thumbValue.frame.maxY,
                position.y >= SliderView.frame.minY,
                position.y <= SliderView.frame.maxY {

                thumbValue.center = CGPoint(x: SliderView.center.x, y: position.y)

                whiteView.frame = CGRect(x: 0, y: 0, width: SliderView.frame.width, height: thumbValue.center.y - SliderView.frame.origin.y)

                let percentSlider = 100 * (1 - whiteView.frame.height / SliderView.frame.height)

                thumbValue.text = "\(Int(percentSlider))%"
            }
        }
    }
}
