//
//  ContactDetailViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var contactName: UILabel!
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        contactName.text = name
    }
}
