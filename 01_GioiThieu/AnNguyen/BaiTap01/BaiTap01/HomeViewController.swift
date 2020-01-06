//
//  HomeViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 12/23/19.
//  Copyright © 2019 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func changeColorButton(_ sender: Any) {
        view.backgroundColor = randomColors()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    fileprivate func randomColors() -> UIColor {
        return UIColor.init(red: CGFloat(Int.random(in: 0...255))/255, green: CGFloat(Int.random(in: 0...255))/255, blue: CGFloat(Int.random(in: 0...255))/255, alpha: 1)
    }
}
