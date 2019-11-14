//
//  MonkeyMessageViewController.swift
//  BaiTapView
//
//  Created by TranVanTien on 11/14/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

class MonkeyMessageViewController: UIViewController {

    @IBOutlet weak var messageBoxLabel: UILabel!
    @IBOutlet weak var monkeyImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        setUpLabel()

        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(recognizer:)))
        let oneTapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTapGesture(recognizer:)))
        oneTapGesture.numberOfTapsRequired = 1

        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture(recognizer:)))
        doubleTapGesture.numberOfTapsRequired = 2

        monkeyImageView.isUserInteractionEnabled = true
        monkeyImageView.addGestureRecognizer(rotateGesture)
        monkeyImageView.addGestureRecognizer(oneTapGesture)
        monkeyImageView.addGestureRecognizer(doubleTapGesture)
    }

    func setUpLabel() {
        messageBoxLabel.clipsToBounds = true
        messageBoxLabel.layer.borderColor = UIColor.black.cgColor
        messageBoxLabel.layer.borderWidth = 2
        messageBoxLabel.layer.cornerRadius = 20
        messageBoxLabel.backgroundColor = .systemBlue
        messageBoxLabel.textAlignment = .center
        messageBoxLabel.textColor = .white
        messageBoxLabel.text = "Tôi là khỉ"

        messageBoxLabel.isHidden = true
    }

    @objc func handleRotate(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            print("handleRotate")
            view.transform = view.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }

    @objc func oneTapGesture(recognizer: UITapGestureRecognizer) {
        if recognizer.view != nil {
            print("one-tap")
            messageBoxLabel.isHidden = false
            messageBoxLabel.alpha = 1
            messageBoxLabel.text = "Tôi là khỉ"
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                UIView.animate(withDuration: 3) {
                    self.messageBoxLabel.alpha = 0
                }
            }
        }
    }

    @objc func doubleTapGesture(recognizer: UITapGestureRecognizer) {
        if recognizer.view != nil {
            print("double-tap")
            messageBoxLabel.isHidden = false
            messageBoxLabel.alpha = 1
            messageBoxLabel.text = "Khỉ là tôi"
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                UIView.animate(withDuration: 3) {
                    self.messageBoxLabel.alpha = 0
                }
            }
        }
    }

}
