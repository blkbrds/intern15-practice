//
//  NewMonkeyViewController.swift
//  Baitap07
//
//  Created by PCI0008 on 12/16/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class NewMonkeyViewController: UIViewController {

    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet private weak var newMonkeyImageView: UIImageView!

    var singleTapOnImageView = UITapGestureRecognizer()
    var doubleTapOnImageView = UITapGestureRecognizer()
    
    private func handleTappingImageView() {
        notificationLabel.isHidden = true
        singleTapOnImageView = UITapGestureRecognizer(target: self, action: #selector(singleTapOnImageViewHandler))
        singleTapOnImageView.numberOfTapsRequired = 1
        newMonkeyImageView.addGestureRecognizer(singleTapOnImageView)
        doubleTapOnImageView = UITapGestureRecognizer(target: self, action: #selector(doubleTapOnImageViewHandler))
        doubleTapOnImageView.numberOfTapsRequired = 2
        newMonkeyImageView.addGestureRecognizer(doubleTapOnImageView)
        singleTapOnImageView.require(toFail: doubleTapOnImageView)
    }
    
    private func displayViewWithAnimation() {
        notificationLabel.center.x = view.center.x
        notificationLabel.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, animations: {
            self.notificationLabel.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 5, animations: {
                self.notificationLabel.center.x -= self.view.bounds.width
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTappingImageView()
    }

    @objc func singleTapOnImageViewHandler() {
        notificationLabel.isHidden = false
        notificationLabel.text = "Tôi là khỉ"
        displayViewWithAnimation()
    }

    @objc func doubleTapOnImageViewHandler() {
        notificationLabel.isHidden = false
        notificationLabel.text = "Khỉ là tôi :)))"
        displayViewWithAnimation()
    }
}
