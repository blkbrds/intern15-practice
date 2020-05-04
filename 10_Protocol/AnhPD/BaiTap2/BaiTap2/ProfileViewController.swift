//
//  ProfileViewController.swift
//  BaiTap2
//
//  Created by PCI0012 on 5/4/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var userName: String = ""
    var imageView: String = ""
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadName()
        // Do any additional setup after loading the view.
    }
    
    func loadName(){
        nameTextField.text = userName
        avatarImageView.image = UIImage(named: imageView)
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
