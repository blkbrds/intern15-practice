//
//  SliderView.swift
//  SliderViewController
//
//  Created by PCI0019 on 6/1/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SliderView: UIView {
    var thumbnailView: UIView!
    var blueSliderView: UIView!
    var thumbnailLabel: UILabel!
    var whiteSliderView: UIView!
    func setUpThumbnailView() {
        whiteSliderView = UIView(frame: CGRect(x: 150, y: 150, width: 20, height: 500))
        if let whiteSliderView = whiteSliderView {
            whiteSliderView.backgroundColor = .white
            whiteSliderView.layer.borderWidth = 1
            self.addSubview(whiteSliderView)
        }
        blueSliderView = UIView(frame: CGRect(x: 150, y: 400, width: 20, height: 250))
        if let blueSliderView = blueSliderView {
            blueSliderView.backgroundColor = .systemBlue
            self.addSubview(blueSliderView)
        }
        thumbnailView = UIView(frame: CGRect(x: 140, y: 390, width: 40, height: 40))
        thumbnailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        if let thumbnailLabel = thumbnailLabel {
            thumbnailLabel.text = "50"
            thumbnailLabel.textAlignment = .center
            thumbnailLabel.textColor = .white
            thumbnailLabel.font = .systemFont(ofSize: 10)
        }
        if let thumbnailView = thumbnailView {
            thumbnailView.backgroundColor = .orange
            thumbnailView.layer.cornerRadius = 20
            if let thumbnailLabel = thumbnailLabel {
                thumbnailView.addSubview(thumbnailLabel)
                self.addSubview(thumbnailView)
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           if let touch = touches.first {
               let position = touch.location(in: self)
               if position.x > whiteSliderView.frame.origin.x && position.x < whiteSliderView.frame.origin.x + whiteSliderView.frame.size.width {
                   let textLabel: Int =  Int((whiteSliderView.bounds.size.height + whiteSliderView.frame.origin.y - position.y) / whiteSliderView.bounds.size.height * 100)
                   if textLabel <= 100 && textLabel >= 0 {
                       thumbnailLabel?.text = String(textLabel)
                       if touch.view == thumbnailView {
                           if var frame = thumbnailView?.frame {
                               if let thumbnailView = thumbnailView {
                               frame.origin.y = position.y - thumbnailView.bounds.size.width / 2
                               thumbnailView.frame = frame
                                   blueSliderView.frame.origin = CGPoint(x: blueSliderView.frame.origin.x, y: position.y)
                                   blueSliderView.frame.size = CGSize(width: 20, height: whiteSliderView.bounds.size.height + whiteSliderView.frame.origin.y  - position.y)
                               }
                           }
                       }
                   }
               }
           }
       }
}
