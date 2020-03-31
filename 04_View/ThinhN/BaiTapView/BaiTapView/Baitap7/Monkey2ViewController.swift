//
//  Monkey2ViewController.swift
//  BaiTapView
//
//  Created by ADMIN on 3/25/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class Monkey2ViewController: UIViewController {

    @IBOutlet private weak var monkeyImageView: UIImageView!
    @IBOutlet private weak var labelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView(){
        labelView.layer.cornerRadius = 1
        labelView.clipsToBounds = true
        labelView.textColor = .white
        labelView.alpha = 0
        labelView.layer.cornerRadius = 20
    }
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        if sender.view != nil {
            UIView.animate(withDuration: 1, animations: {
                self.labelView.alpha = 1
                self.labelView.text = "Tôi là khỉ "
            })
            UIView.animate(withDuration: 1, delay: 5, options: [], animations: {
                self.labelView.alpha = 0
            })
        }
    }
    @IBAction func doubleTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        if sender.view != nil {
            UIView.animate(withDuration: 2, animations: {
                self.labelView.alpha = 1
                self.labelView.text = "Khỉ là Tôi"
            })
            UIView.animate(withDuration: 1, delay: 5, options: [], animations: {
                self.labelView.alpha = 0
            })
        }
    }
}
