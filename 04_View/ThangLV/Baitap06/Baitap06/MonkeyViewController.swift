//
//  MonkeyViewController.swift
//  Baitap06
//
//  Created by PCI0008 on 12/16/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class MonkeyViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var monkeyImageView: UIImageView!
    var pinchGesture = UIPinchGestureRecognizer()
    var rotationGesture = UIRotationGestureRecognizer()
    var longPressGesture = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGestureHandler))
        monkeyImageView.addGestureRecognizer(pinchGesture)
        rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotationGestureHandler))
        monkeyImageView.addGestureRecognizer(rotationGesture)
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureHandler))
        monkeyImageView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func pinchGestureHandler(recognizer: UIPinchGestureRecognizer) {
        view.bringSubviewToFront(monkeyImageView)
        recognizer.view?.transform = (recognizer.view?.transform)!.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 0.5
    }
    
    @objc func rotationGestureHandler(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    @objc func longPressGestureHandler(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .began:
            UIView.animate(withDuration: 5.0,
                           animations: {
                            self.monkeyImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        case .ended:
            UIView.animate(withDuration: 5.0) {
                self.monkeyImageView.transform = CGAffineTransform.identity
            }
        default: break
        }
    }
}
