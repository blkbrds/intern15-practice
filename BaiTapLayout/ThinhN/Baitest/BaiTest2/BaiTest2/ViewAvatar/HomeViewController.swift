//
//  HomeViewController.swift
//  BaiTest2
//
//  Created by PCI0019 on 5/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var offButton: UIButton!
             
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        onlineButton.layer.masksToBounds = true
        onlineButton.layer.cornerRadius = 15
        onlineButton.clipsToBounds = true
        onlineButton.layer.borderWidth = 2
        
        offButton.layer.masksToBounds = true
        offButton.layer.cornerRadius = 15
        offButton.clipsToBounds = true
        offButton.layer.borderWidth = 2
    }
    
    @IBAction func onlineButtonTouchUpInsine(_ sender: Any) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.isOnline = true
    }
    
    @IBAction func OffButtonTouchUpInsine(_ sender: Any) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
