//
//  MonkeyVC.swift
//  BaiTap06
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

final class MonkeyVC: UIViewController, UITextViewDelegate {

    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "monkey2")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let messengeView: MessengeView = {
        let mesView = MessengeView(frame: CGRect(x: 0, y: 0, width:  200, height: 130))
        
        return mesView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupUI()
    }

    private func setupUI() {
        view.addSubview(imageView)
        imageView.layer.position = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
        let pingGesture = UIPinchGestureRecognizer()
        pingGesture.addTarget(self, action: #selector(handleScaleImage))
        pingGesture.scale = 1
        imageView.addGestureRecognizer(pingGesture)
        let rotationGesture = UIRotationGestureRecognizer()
        rotationGesture.addTarget(self, action: #selector(handleRotate))
        imageView.addGestureRecognizer(rotationGesture)
        let longGesture = UILongPressGestureRecognizer()
        longGesture.addTarget(self, action: #selector(handleLongGesture))
        //longGesture.minimumPressDuration = TimeInterval(exactly: 5.0)!
        imageView.addGestureRecognizer(longGesture)

        //Bai 07
        let oneTapGesture = UITapGestureRecognizer()
        oneTapGesture.numberOfTapsRequired = 1
        oneTapGesture.addTarget(self, action: #selector(handleOneTap))
        imageView.addGestureRecognizer(oneTapGesture)
        let doubleTapGesture = UITapGestureRecognizer()
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.addTarget(self, action: #selector(handleDoubleTap))
        imageView.addGestureRecognizer(doubleTapGesture)

        messengeView.frame = CGRect(x: imageView.frame.minX, y: imageView.frame.minY - 100, width: 200, height: 130)
        messengeView.isHidden = true
        view.addSubview(messengeView)
    }

    @objc private func handleOneTap(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 2) {
            self.messengeView.isHidden = false
            self.messengeView.messengeLabel.text = "Tôi là khỉ."
        }
        autoHiddenMessenge()
    }

    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 2) {
            self.messengeView.isHidden = false
            self.messengeView.messengeLabel.text = "Khỉ là tôi"
        }
        autoHiddenMessenge()
    }
    
    private func autoHiddenMessenge(){
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
            self.messengeView.isHidden = true
        }
    }

    @objc private func handleScaleImage(_ sender: UIPinchGestureRecognizer) {
        if sender.scale > 2 {
            sender.scale = 2
        } else if sender.scale < 0.25 {
            sender.scale = 0.25
        }
        imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }

    @objc private func handleRotate(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        sender.rotation = 0
    }

    @objc private func handleLongGesture(_ sender: UILongPressGestureRecognizer) {
        imageView.frame.size = CGSize(width: 150, height: 150)
        imageView.layer.position = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    }
}
