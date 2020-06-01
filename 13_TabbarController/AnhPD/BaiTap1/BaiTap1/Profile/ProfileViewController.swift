//
//  ProfileViewController.swift
//  BaiTap1
//
//  Created by PCI0012 on 6/1/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
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
