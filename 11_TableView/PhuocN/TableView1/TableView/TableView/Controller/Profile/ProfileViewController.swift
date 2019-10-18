//
//  ProfileViewController.swift
//  TableView
//
//  Created by PhuocNguyen on 10/18/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    var userName: String?
    
    @IBOutlet private weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
    }
}
