//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex3ViewController: BaseViewController {
    
    @IBOutlet private weak var emailButton: UIButton!
    @IBOutlet private weak var friendButton: UIButton!
    @IBOutlet private weak var photoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailButton.layer.cornerRadius = 5
        emailButton.addLocationToButton(location: .topLeft, value: "15")
        
        friendButton.layer.cornerRadius = 5
        friendButton.addLocationToButton(location: .topRight, value: "99+")
        
        photoButton.layer.cornerRadius = 5
        photoButton.addLocationToButton(location: .centerRight, value: "7")
    }
}
