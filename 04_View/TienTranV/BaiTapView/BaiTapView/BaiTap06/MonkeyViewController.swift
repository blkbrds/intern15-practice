//
//  MonkeyViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

class MonkeyViewController: UIViewController {

    @IBOutlet weak var monkeyImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(recognizer:)))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        longPressGesture.minimumPressDuration = TimeInterval(5.0)

        monkeyImageView.isUserInteractionEnabled = true
        monkeyImageView.addGestureRecognizer(pinchGesture)
        monkeyImageView.addGestureRecognizer(rotateGesture)
        monkeyImageView.addGestureRecognizer(longPressGesture)
    }

    @objc func handlePinch(recognizer: UIPinchGestureRecognizer) {
        print("handlePinch")
        guard let view = recognizer.view else { return }
        guard recognizer.scale <= 2 && recognizer.scale >= 0.5 else { return }
        view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    }

    @objc func handleRotate(recognizer: UIRotationGestureRecognizer) {
        print("handleRotate")
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }

    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        if let view = recognizer.view {
            UIView.animate(withDuration: 3.0) {
                view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
                view.transform = CGAffineTransform(rotationAngle: 0)

                print("handleLongPress")
            }
        }
    }
}
