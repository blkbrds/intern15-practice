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
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
