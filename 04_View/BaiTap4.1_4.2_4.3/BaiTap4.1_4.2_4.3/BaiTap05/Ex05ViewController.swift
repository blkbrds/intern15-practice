//
//  Ex05ViewController.swift
//  BaiTap4.1_4.2_4.3
//
//  Created by ANH NGUYỄN on 10/8/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class Ex05ViewController: UIViewController {

    @IBOutlet weak var truView: UIView!
    @IBOutlet weak var mauView: UIView!
    @IBOutlet weak var silderButton: UILabel!
    let containerView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        truView.layer.borderWidth = 1
        truView.layer.cornerRadius = 20
        truView.layer.borderColor = UIColor.black.cgColor

        silderButton.layer.cornerRadius = 20
        silderButton.clipsToBounds = true

        mauView.layer.cornerRadius = 20

        silderButton.center = CGPoint(x: truView.frame.midX, y: truView.frame.maxY)
        mauView.frame = CGRect(x: truView.frame.maxX, y: truView.frame.maxY, width: 0, height: 0)

        let pan = UIPanGestureRecognizer(target: self, action: #selector(Ex05ViewController.handlePan(sender:)))
        silderButton.addGestureRecognizer(pan)

        // Do any additional setup after loading the view.
    }
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if silderButton.center.y >= truView.frame.minY && silderButton.center.y + translation.y <= truView.frame.maxY {
            silderButton.center = CGPoint(x: silderButton.center.x, y: silderButton.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            mauView.frame = CGRect(x: truView.frame.minX, y: silderButton.center.y, width: truView.frame.width, height: truView.frame.maxY - silderButton.center.y)
            silderButton.text = "\(Int((truView.frame.maxY - silderButton.center.y) / (truView.frame.maxY - truView.frame.minY) * 100))%"
        }
    }
}


