//
//  BadgeViewController.swift
//  baitap5.3
//
//  Created by user on 11/21/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class BadgeViewController: UIViewController {

    @IBOutlet private weak var photoButton: UIButton!
    @IBOutlet private weak var friendButton: UIButton!
    @IBOutlet private weak var emailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailButton.layer.cornerRadius = 5
        emailButton.addLocationToButton(location: .topLeft, value: "5")
        friendButton.layer.cornerRadius = 5
        friendButton.addLocationToButton(location: .topRight, value: "99+")
        photoButton.layer.cornerRadius = 5
        photoButton.addLocationToButton(location: .centerRight, value: "7")
    }
}
