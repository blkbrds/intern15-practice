//
//  MonkeyViewController.swift
//  BaitapView
//
//  Created by PhuocNguyen on 10/6/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class MonkeyViewController: UIViewController {
  
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var commentImage: UIImageView!
  @IBOutlet weak var commentLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    image.isUserInteractionEnabled = true
    commentImage.isHidden = true
    commentLabel.isHidden = true
    
    let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateImage(_:)))
    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressImage(_:)))
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchImage(_:)))
    longPressGesture.minimumPressDuration = TimeInterval(5.0)
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
    tapGesture.numberOfTapsRequired = 1
    let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapImage(_:)))
    doubleTapGesture.numberOfTapsRequired = 2
    image.addGestureRecognizer(rotationGesture)
    image.addGestureRecognizer(longPressGesture)
    image.addGestureRecognizer(pinchGesture)
    image.addGestureRecognizer(tapGesture)
    image.addGestureRecognizer(doubleTapGesture)
  }
  
  @objc func rotateImage(_ sender: UIRotationGestureRecognizer) {
    guard let view = sender.view else { return }
    view.transform = view.transform.rotated(by: sender.rotation)
    sender.rotation = 0
  }
  
  @objc func longPressImage(_ sender: UILongPressGestureRecognizer) {
    UIView.animate(withDuration: 1) {
      self.image.transform = CGAffineTransform(scaleX: 1, y: 1)
      self.image.transform = CGAffineTransform(rotationAngle: 0)
    }
  }
  
  @objc func pinchImage(_ sender: UIPinchGestureRecognizer) {
    guard let view = sender.view else { return }
    guard sender.scale <= 2 && sender.scale >= 0.5 else { return }
    view.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
  }
  
  @objc func tapImage(_ sender: UITapGestureRecognizer) {
    commentImage.isHidden = false
    commentLabel.isHidden = false
    commentLabel.text = "Tôi là khỉ"
    self.commentImage.alpha = 1
    self.commentLabel.alpha = 1
    Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
      UIView.animate(withDuration: 1) {
        self.commentImage.alpha = 0
        self.commentLabel.alpha = 0
      }
    }
  }
  
  @objc func doubleTapImage(_ sender: UITapGestureRecognizer) {
    commentImage.isHidden = false
    commentLabel.isHidden = false
    commentLabel.text = "Khỉ là tôi"
    self.commentImage.alpha = 1
    self.commentLabel.alpha = 1
    Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
      UIView.animate(withDuration: 1) {
        self.commentImage.alpha = 0
        self.commentLabel.alpha = 0
      }
    }
  }
  
}


