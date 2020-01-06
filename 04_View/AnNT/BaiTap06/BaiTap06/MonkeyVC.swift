//
//  MonkeyVC.swift
//  BaiTap06
//
//  Created by An Nguyễn on 12/25/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

final class MonkeyVC: UIViewController {

    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        imageView.image = UIImage(named: "monkey")
        imageView.isUserInteractionEnabled = true
        return imageView
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
        imageView.frame.size = CGSize(width: 400, height: 400)
        imageView.layer.position = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2)
    }
}
