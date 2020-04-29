//
//  DesignViewController.swift
//  BaiTapTestLayout
//
//  Created by PCI0012 on 4/29/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController {

    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarView1: UIView!
    @IBOutlet weak var informationView: UIView!
    @IBOutlet weak var informationView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        //setup Avatar
        avatarView.layer.borderWidth = 1
        avatarView.layer.cornerRadius = avatarView.frame.size.height / 2
        avatarView.clipsToBounds = true
        
        avatarView1.layer.borderWidth = 1
        avatarView1.layer.cornerRadius = avatarView1.frame.size.height / 2
        avatarView1.clipsToBounds = true
        
        //setup informationView
        informationView.layer.borderWidth = 1
        informationView.layer.cornerRadius = 5
        informationView1.clipsToBounds = true
        
        informationView1.layer.borderWidth = 1
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
