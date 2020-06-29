//
//  DetailNameViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class DetailNameViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var contactName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        nameLabel.text = contactName
    }
}
