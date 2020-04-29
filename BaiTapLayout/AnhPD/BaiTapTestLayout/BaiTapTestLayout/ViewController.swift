//
//  ViewController.swift
//  BaiTapTestLayout
//
//  Created by PCI0012 on 4/29/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarImageView1: UIImageView!
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var informationView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Danh sách bạn bè"
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        //setup avatarImageView
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        avatarImageView.clipsToBounds = true
        
        //setup avatarImageView1
        avatarImageView1.layer.borderWidth = 1.0
        avatarImageView1.layer.masksToBounds = false
        avatarImageView1.layer.cornerRadius = avatarImageView1.frame.size.height / 2
        avatarImageView1.clipsToBounds = true
        
        //setup informationLabel
        informationView.layer.masksToBounds = false
        informationView.layer.cornerRadius = 5
        informationView.clipsToBounds = true
        
        //setup informationLabel1
        informationView1.layer.masksToBounds = false
        informationView1.layer.cornerRadius = 5
        informationView1.clipsToBounds = true
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
