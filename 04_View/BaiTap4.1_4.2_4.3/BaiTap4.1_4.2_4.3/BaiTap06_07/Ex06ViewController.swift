//
//  Ex06ViewController.swift
//  BaiTap4.1_4.2_4.3
//
//  Created by ANH NGUYỄN on 10/9/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class Ex06ViewController: UIViewController, UIGestureRecognizerDelegate {


    @IBOutlet weak var commentLable: UILabel!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var mokeyView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        // Do any additional setup after loading the view.
    }
    private func configView() {
        mokeyView.isUserInteractionEnabled = true
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        pinch.delegate = self
        mokeyView.addGestureRecognizer(pinch)

        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        rotate.delegate = self
        mokeyView.addGestureRecognizer(rotate)

        let longPressed = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressed.minimumPressDuration = 5
        longPressed.delaysTouchesBegan = true
        longPressed.delegate = self
        mokeyView.addGestureRecognizer(longPressed)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(comment))
        tapGesture.numberOfTapsRequired = 1
        mokeyView.addGestureRecognizer(tapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubuleComment))
        doubleTapGesture.numberOfTapsRequired = 2
        mokeyView.addGestureRecognizer(doubleTapGesture)


    }


    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        }
    }

    @objc func handleRotate(sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = ((sender.view?.transform.rotated(by: sender.rotation))!)
            sender.rotation = 0
        }
    }

    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            mokeyView.transform = .identity
        }
    }
    @objc func comment(seder: UITapGestureRecognizer) {
        commentLable.text = "toi khi la "
        self.commentImage.alpha = 1
        self.commentLable.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in UIView.animate(withDuration: 1) {
                self.commentImage.alpha = 0
                self.commentLable.alpha = 0
            }

        }
    }
    @objc func doubuleComment(seder: UITapGestureRecognizer)
    {
        commentLable.text = "khi la toi"
        self.commentImage.alpha = 1
        self.commentLable.alpha = 1
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in UIView.animate(withDuration: 1) {
                self.commentImage.alpha = 0
                self.commentLable.alpha = 0
            }

        }
        print("hhahhahahahahah")
    }

}
