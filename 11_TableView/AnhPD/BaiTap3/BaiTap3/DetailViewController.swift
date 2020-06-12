//
//  DetailViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/13/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = userName
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
