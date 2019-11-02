//
//  Ex12ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0018 on 10/22/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class Ex12ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

final class ThongButton: UIButton {

    override init(frame: CGRect){
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
