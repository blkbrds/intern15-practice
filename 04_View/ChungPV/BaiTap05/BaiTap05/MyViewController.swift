//
//  MyViewController.swift
//  BaiTap05
//
//  Created by MBA0168 on 6/8/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    
    @IBOutlet weak var trackView: UIView!
    @IBOutlet weak var thumbView: UIView!
    @IBOutlet weak var sliderLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set track view
        trackView.layer.borderWidth = 1
    
        // set thumb
        thumbView.layer.borderWidth = 1
        thumbView.backgroundColor = .blue
        thumbView.frame = CGRect(x: trackView.frame.minX, y: trackView.frame.maxY, width: 45, height: 45)
        
        
     
        // set label
        sliderLabel.layer.cornerRadius = 25
        sliderLabel.layer.masksToBounds = true
        sliderLabel.backgroundColor = .orange
        sliderLabel.layer.borderWidth = 1
        sliderLabel.isUserInteractionEnabled = true
        sliderLabel.text = "0%"
        sliderLabel.frame = CGRect(x: trackView.frame.minX, y: trackView.frame.maxY, width: 50, height: 50)
        
        // pan
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.panVertical(sender:)))
        sliderLabel.addGestureRecognizer(pan)
    }
    @objc func panVertical(sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: trackView)
        if sliderLabel.center.y + translation.y >= thumbView.frame.minX && sliderLabel.center.y + translation.y <= thumbView.frame.maxY {
            sliderLabel.center = CGPoint(x: sliderLabel.center.x, y: sliderLabel.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: trackView)
            thumbView.frame = CGRect(x: trackView.frame.minX, y: sliderLabel.center.y, width: 45, height: thumbView.frame.maxY - sliderLabel.center.y)
            sliderLabel.text = "\(Int(thumbView.frame.height * 100 / trackView.frame.height))"
            
        } else if sliderLabel.center.y + translation.y < thumbView.frame.minY {
            sliderLabel.text = "100%"
        }
    }

}
