//
//  bai12ViewController.swift
//  AutoLayout
//
//  Created by ADMIN on 4/14/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class bai12ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    final class ThongButton: UIButton {

        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            setup()
        }

        func setup() {
            self.clipsToBounds = true
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 1.0
        }
    }
}
