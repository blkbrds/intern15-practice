//
//  DetailViewController.swift
//  BaiTest2
//
//  Created by PCI0019 on 5/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var isOnline: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        if isOnline {
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }
}
