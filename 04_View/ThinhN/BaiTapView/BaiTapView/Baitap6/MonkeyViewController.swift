//
//  MonkeyViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/24/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class MonkeyViewController: UIViewController {

    @IBOutlet weak var monkeyImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        if sender.scale <= 2 && sender.scale >= 0.5 {
            senderView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }
    }
    
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
        guard let senderView = sender.view else {
            return
        }
        senderView.transform = senderView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func long(_ sender: UILongPressGestureRecognizer) {
        if let view = sender.view {
          UIView.animate(withDuration: 0.5) {
              view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
              view.transform = CGAffineTransform(rotationAngle: 0)
            }
        }
    }
}
