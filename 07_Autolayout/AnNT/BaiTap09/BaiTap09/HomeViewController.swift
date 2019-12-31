//
//  HomeViewController.swift
//  BaiTap09
//
//  Created by An Nguyễn on 12/28/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    let images = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9"]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: images[index])!
    }

    @IBAction func nextButton(_ sender: Any) {
        if index >= images.count - 1 {
            index = 0
        } else {
            index += 1
        }
        imageView.image = UIImage(named: images[index])!
    }

    @IBAction func backButton(_ sender: Any) {
        if index <= 0 {
            index = images.count - 1
        } else {
            index -= 1
        }
        imageView.image = UIImage(named: images[index])!
    }
}
