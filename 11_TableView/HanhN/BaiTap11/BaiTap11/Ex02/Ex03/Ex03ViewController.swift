//
//  Ex03ViewController.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/12/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    
    var contact : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactNameLabel.text = contact
    }
}
