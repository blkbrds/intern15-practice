//
//  DetailViewController.swift
//  TableView
//
//  Created by ADMIN on 6/30/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        contactNameLabel.text = name
    }
}
