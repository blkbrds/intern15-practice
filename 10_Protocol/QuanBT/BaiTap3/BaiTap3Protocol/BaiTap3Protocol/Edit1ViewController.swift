//
//  Edit1ViewController.swift
//  BaiTap3Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

struct DataPlace {
    var domainData: String = ""
    var provincialData: String = ""
    var districtData: String = ""
}

final class Edit1ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private var domainButtons: [UIButton]!
    
    // MARK: - Properties
    var place: DataPlace = DataPlace()
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in domainButtons {
            item.layer.borderWidth = 2
            item.layer.borderColor = UIColor.blue.cgColor
            item.layer.cornerRadius = 10
            item.clipsToBounds = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        title = "Miền"
        let editButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(domain))
        navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - IBAction
    @IBAction private func domainTouchUpInside(_ sender: UIButton) {
        for item in domainButtons {
            item.backgroundColor = .none
            item.setTitleColor(.black, for: .normal)
        }
        domainButtons[sender.tag].backgroundColor = .blue
        domainButtons[sender.tag].setTitleColor(.white, for: .normal)
        if let domainName = domainButtons[sender.tag].titleLabel?.text {
            self.place.domainData = domainName
        }
    }
  
    // MARK: - Function
    @objc private func domain() {
        let vcEdit2 = Edit2ViewController()
        vcEdit2.place = self.place
        navigationController?.pushViewController(vcEdit2, animated: true)
    }
}
