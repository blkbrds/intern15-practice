//
//  MonkeyViewController.swift
//  baitap4.6+4.7
//
//  Created by user on 11/20/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class MonkeyViewController: UIViewController {

    @IBOutlet private weak var monkeyImageView: UIImageView!
    @IBOutlet private weak var monkeyLabel: UILabel!

    var scaleSize: CGSize = CGSize.zero

    override func viewDidLoad() {
        super.viewDidLoad()

        scaleSize = monkeyImageView.frame.size
        let rotateGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(MonkeyViewController.handleRotate(sender:)))
        monkeyImageView.addGestureRecognizer(rotateGestureRecognizer)

        let pinchGestureRecognizer = UIPinchGestureRecognizer (target: self, action: #selector(MonkeyViewController.handlePinch(sender:)))
        monkeyImageView.addGestureRecognizer(pinchGestureRecognizer)

        let longPressGestureRecognizer = UILongPressGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleLongPress(sender:)))
        longPressGestureRecognizer.minimumPressDuration = 4
        monkeyImageView.addGestureRecognizer(longPressGestureRecognizer)

        let tapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleTap(sender:)))
        monkeyImageView.addGestureRecognizer(tapGestureRecognizer)

        let doubleTapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(MonkeyViewController.handleDoubleTap(sender:)))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        monkeyImageView.addGestureRecognizer(doubleTapGestureRecognizer)
    }

    @objc private func handleDoubleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.monkeyLabel.text = "Khỉ là tôi"
            self.monkeyLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                self.monkeyLabel.alpha = 0
            })
        }
    }

    @objc private func handleTap(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.monkeyLabel.text = "Tôi là khỉ"
            self.monkeyLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 4, animations: {
                self.monkeyLabel.alpha = 0
            })
        }
    }

    @objc private func handleRotate(sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }

    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            self.monkeyImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.monkeyImageView.transform = CGAffineTransform(rotationAngle: 0)
        }
    }

    @objc private func handlePinch(sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            if sender.scale <= 2 && sender.scale >= 0.5 {
                view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            }
        }
    }
}

