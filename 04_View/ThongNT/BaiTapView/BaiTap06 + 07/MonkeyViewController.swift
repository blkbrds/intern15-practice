//
//  MonkeyViewController.swift
//  BaiTapView
//
//  Created by PCI0018 on 10/9/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

final class MonkeyViewController: UIViewController {
    @IBOutlet weak var monkeyView: UIImageView!
    @IBOutlet weak var monkeyLabel: UILabel!

    var scaleSize: CGSize = CGSize.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        scaleSize = monkeyView.frame.size

        let rotateGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(MonkeyViewController.handleRotate(sender:)))
        monkeyView.addGestureRecognizer(rotateGestureRecognizer)

        let pinchGestureRecognizer = UIPinchGestureRecognizer (target: self, action: #selector(MonkeyViewController.handlePinch(sender:)))
        monkeyView.addGestureRecognizer(pinchGestureRecognizer)

        let longPressGestureRecognizer = UILongPressGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleLongPress(sender:)))
        longPressGestureRecognizer.minimumPressDuration = 4
        monkeyView.addGestureRecognizer(longPressGestureRecognizer)

        let tapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleTap(sender:)))
        monkeyView.addGestureRecognizer(tapGestureRecognizer)

        let doubleTapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleDoubleTap(sender:)))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        monkeyView.addGestureRecognizer(doubleTapGestureRecognizer)

    }

    @objc func handleDoubleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.monkeyLabel.text = "Khỉ là tôi"
            self.monkeyLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                self.monkeyLabel.alpha = 0
            })
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.monkeyLabel.text = "Tôi là khỉ"
            self.monkeyLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                self.monkeyLabel.alpha = 0
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

