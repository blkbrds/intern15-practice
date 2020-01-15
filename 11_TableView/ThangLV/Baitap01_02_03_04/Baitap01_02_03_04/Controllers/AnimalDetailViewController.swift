//
//  AnimalDetailViewController.swift
//  Baitap01_02_03_04
//
//  Created by PCI0008 on 1/13/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {

    @IBOutlet weak var animalNameLabel: UILabel!
    
    var animalName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        animalNameLabel.text = animalName
    }
}
