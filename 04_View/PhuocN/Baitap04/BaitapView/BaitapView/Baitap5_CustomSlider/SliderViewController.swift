//
//  SliderViewController.swift
//  BaitapView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
  
  @IBOutlet weak var activeView: UIView!
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var thumb: UILabel!
  let height: CGFloat = 400
  
  override func viewDidLoad() {
    super.viewDidLoad()
    thumb.isUserInteractionEnabled = true
    thumb.clipsToBounds = true
    backgroundView.frame = CGRect(x: 0, y: 0, width: 50, height: height)
    backgroundView.center = view.center
    backgroundView.layer.borderColor = UIColor.systemBlue.cgColor
    backgroundView.layer.borderWidth = 0.5
    
    thumb.clipsToBounds = true
    thumb.layer.cornerRadius = thumb.frame.height / 2
    thumb.center =  CGPoint(x: backgroundView.frame.minX + backgroundView.frame.width / 2, y: backgroundView.frame.maxY)
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
    thumb.addGestureRecognizer(panGesture)
    
    activeView.frame = CGRect(origin: thumb.center, size: CGSize.zero)
    thumb.text = "0"
  }
  
  @objc func pan(_ sender: UIPanGestureRecognizer) {
    let transition = sender.translation(in: backgroundView)
    guard thumb.center.y + transition.y <= backgroundView.frame.maxY && thumb.center.y + transition.y + 1 >= backgroundView.frame.minY else { return }
    thumb.center = CGPoint(x: thumb.center.x, y: thumb.center.y + transition.y)
    sender.setTranslation(CGPoint.zero, in: backgroundView)
    activeView.frame = CGRect(x: backgroundView.frame.minX, y: thumb.center.y, width: backgroundView.frame.width, height: backgroundView.frame.maxY - thumb.center.y)
    thumb.text = "\(Int(activeView.frame.height * 100 / backgroundView.frame.height))"
  }
  
}
