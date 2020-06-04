//
//  HomeViewController2.swift
//  Autolayout
//
//  Created by PCI0019 on 6/4/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class HomeViewController2: UIViewController {
    
    @IBOutlet weak var imageView1: UIView!
    @IBOutlet weak var imageView2: UIView!
    @IBOutlet weak var imageView3: UIView!
    
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String = "TranVanA"
    var date: String = "01/05/2002"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = "Home"
        updateView()
    }
    func updateView() {
        nameLabel.text = name
        dateOfBirthLabel.text = date
    }
    func setupView() {
        imageView1.layer.cornerRadius = 50
        imageView2.layer.cornerRadius = 50
        imageView3.layer.cornerRadius = 50
        
    }
    @IBAction func button1TouchUpInsine(_ sender: Any) {
        let vc = DetailViewController2()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func button2TouchUpInsine(_ sender: Any) {
        let vc = DetailViewController2()
         vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func button3TouchUpInsine(_ sender: Any) {
        let vc = DetailViewController2()
         vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController2: DetailDelegate {
    func passData(name: String, date: String) {
        
    }
}
