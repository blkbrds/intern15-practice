//
//  AutoLayoutViewController.swift
//  Baitest
//
//  Created by ADMIN on 4/29/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scripLabel: UILabel!
    @IBOutlet weak var image2View: UIImageView!
    @IBOutlet weak var scrip2View: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.layer.borderWidth = 2
        imageView.clipsToBounds = true
        image2View.layer.cornerRadius = image2View.frame.size.height / 2
        image2View.layer.borderWidth = 1
        image2View.clipsToBounds = true
        scripLabel.clipsToBounds = true
        scripLabel.layer.borderWidth = 2
        scripLabel.layer.cornerRadius = 5
        scrip2View.clipsToBounds = true
        scrip2View.layer.borderWidth = 1
        scrip2View.layer.cornerRadius = 5
    }
}

