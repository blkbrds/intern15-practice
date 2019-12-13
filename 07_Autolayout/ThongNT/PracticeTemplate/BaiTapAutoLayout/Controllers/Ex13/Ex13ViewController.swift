//
//  Ex13ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0018 on 10/22/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class Ex13ViewController: UIViewController {

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var stackViewTop: UIStackView!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewTop.addBackground(color: UIColor.init(red: 255, green: 0, blue: 0, alpha: 1))
        tenLabel.layer.cornerRadius = tenLabel.bounds.width / 2
        editButton.layer.cornerRadius = 5
    }
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
