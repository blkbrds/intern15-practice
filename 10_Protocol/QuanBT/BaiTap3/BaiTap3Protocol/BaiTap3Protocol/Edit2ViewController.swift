//
//  Edit2ViewController.swift
//  BaiTap3Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class Edit2ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var provincialButtons: [UIButton]!
    
    // MARK: - Properties
    var place: DataPlace = DataPlace()
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in provincialButtons {
            item.layer.borderWidth = 2
            item.layer.borderColor = UIColor.green.cgColor
            item.layer.cornerRadius = 10
            item.clipsToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Tỉnh"
        let editButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(provincial))
        navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - IBAction
    @IBAction private func provincialTouchUpInside(_ sender: UIButton) {
        for item in provincialButtons {
            item.backgroundColor = .none
            item.setTitleColor(.black, for: .normal)
        }
        provincialButtons[sender.tag].backgroundColor = .green
        provincialButtons[sender.tag].setTitleColor(.white, for: .normal)
        if let provincialName = provincialButtons[sender.tag].titleLabel?.text {
            self.place.provincialData = provincialName
        }
    }
    
    // MARK: - Function
    @objc private func provincial() {
        let vcEdit3 = Edit3ViewController()
        vcEdit3.place = self.place
        navigationController?.pushViewController(vcEdit3, animated: true)
    }
}
