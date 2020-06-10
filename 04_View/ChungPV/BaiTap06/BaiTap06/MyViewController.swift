//
//  MyViewController.swift
//  BaiTap06
//
//  Created by MBA0168 on 6/11/20.
//  Copyright © 2020 chungiOS. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var previousLocation = CGPoint.zero
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotationGesture))
        let zoom = UIPinchGestureRecognizer(target: self, action: #selector(self.zoomGesture))
        let hold = UILongPressGestureRecognizer(target: self, action: #selector(self.hold))
        hold.minimumPressDuration = TimeInterval(5.0)
        imageView.addGestureRecognizer(rotationGesture)
        
        imageView.addGestureRecognizer(zoom)
        
        imageView.addGestureRecognizer(hold)
    }
    @objc func rotationGesture(sender: UIRotationGestureRecognizer){
        sender.view?.transform = ((sender.view?.transform)!.rotated(by: sender.rotation))
        sender.rotation = 0
        
    }
    @objc func zoomGesture(sender: UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(imageView)
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
    }
    @objc func hold(sender: UILongPressGestureRecognizer){
        let view = sender.view
        UIView.animate(withDuration: 5.0){
            view?.transform = (view?.transform.scaledBy(x: 1.0, y: 1.0))!
            view?.transform.rotated(by: 0)
            
        }
        
    }

}
