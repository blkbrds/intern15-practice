//
//  MySliderView.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 10/15/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit
protocol MySliderViewDelegate {
    func mySliderView(mySliderView: MySliderView, valueOfTextField: Int)
}

class MySliderView: UIView {
    var valueOfView: Int = 0
    var sliderLabel = UILabel()
    var sliderView  = UIImageView()

//    weak var delegate: MySliderViewDelegate?
    var cylinder: UIColor = .green{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame frmae: CGRect){
        super.init(frame: frmae)
        backgroundColor = .clear
        sliderLabel.frame = CGRect(x: 20, y: 300, width: 40, height: 30)
        sliderLabel.center = CGPoint(x: 20, y: 400)
        sliderLabel.backgroundColor = .black
        sliderLabel.text = "0%"
        addSubview(sliderLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect){
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.move(to: CGPoint(x: 5, y: 20))
        context?.addLine(to: CGPoint(x: 20 , y: 400))
        context?.addLine(to: CGPoint(x: 50 , y: 20 ))
        
        context?.closePath()
        context?.setLineWidth(2)
        context?.strokePath()
        
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: self)
        if sliderLabel.center.y + translation.y <= 150 && sliderLabel.center.y + translation.y <=  500{
            sliderLabel.center = CGPoint(x: sliderLabel.center.x, y: sliderLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: superview)
        }
        
        
    }
}
