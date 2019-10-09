//
//  MonkeyViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/9/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

class MonkeyViewController: UIViewController {
    @IBOutlet weak var monkeyView: UIImageView!
    @IBOutlet weak var monkeylabel: UILabel!
    var scaleSize: CGSize = CGSize.zero



    override func viewDidLoad() {
        super.viewDidLoad()
        scaleSize = monkeyView.frame.size

        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(MonkeyViewController.handleRotate(sender:)))
        monkeyView.addGestureRecognizer(rotate)

        let pinch = UIPinchGestureRecognizer (target: self, action: #selector(MonkeyViewController.handlePinch(sender:)))
        monkeyView.addGestureRecognizer(pinch)

        let longPress = UILongPressGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleLongPress(sender:)))
        longPress.minimumPressDuration = 4
        monkeyView.addGestureRecognizer(longPress)

        let tap = UITapGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleTap(sender:)))
        monkeyView.addGestureRecognizer(tap)

        let doubleTap = UITapGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleDoubleTap(sender:)))
        doubleTap.numberOfTapsRequired = 2
        monkeyView.addGestureRecognizer(doubleTap)

    }

    @objc func handleDoubleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.monkeylabel.text = "Khỉ là tôi"
            self.monkeylabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                self.monkeylabel.alpha = 0
            })
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.monkeylabel.text = "Tôi là khỉ"
            self.monkeylabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                self.monkeylabel.alpha = 0
            })
        }
    }

    @objc func handleRotate(sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }

    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            self.monkeyView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.monkeyView.transform = CGAffineTransform(rotationAngle: 0)
        }
    }

    @objc func handlePinch(sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            if sender.scale <= 2 && sender.scale >= 0.5 {
                view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            }
        }
    }
}

