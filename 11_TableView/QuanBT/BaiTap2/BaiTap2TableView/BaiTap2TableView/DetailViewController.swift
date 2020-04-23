//
//  DetailViewController.swift
//  BaiTap2TableView
//
//  Created by Sếp Quân on 4/1/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var contactsNameLabel: UILabel!
    
    // MARK: - Properties
    var name: String = ""
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        contactsNameLabel.text = name
    }
}
