//
//  SubView.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SubView: UIView {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var button: UIButton!
    func setupView() {
        avatarView.layer.cornerRadius = 75
        avatarView.layer.borderWidth = 0.5
    }
}
