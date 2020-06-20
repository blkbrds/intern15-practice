//
//  Edit3ViewController.swift
//  BaiTap3Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class Edit3ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet var districtButtons: [UIButton]!
    
    // MARK: - Properties
    var place: DataPlace = DataPlace()
    var domainText: String?
    var provincialText: String?
    var districtText: String?
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in districtButtons {
            item.layer.borderWidth = 2
            item.layer.borderColor = UIColor.orange.cgColor
            item.layer.cornerRadius = 10
            item.clipsToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Huyện"
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButton
    }

    // MARK: - IBAction
    @IBAction private func districtTouchUpInside(_ sender: UIButton) {
        for item in districtButtons {
            item.backgroundColor = .none
            item.setTitleColor(.black, for: .normal)
        }
        districtButtons[sender.tag].backgroundColor = .orange
        districtButtons[sender.tag].setTitleColor(.white, for: .normal)
        if let districtName = districtButtons[sender.tag].titleLabel?.text {
            self.place.districtData = districtName
        }
    }
    
    // MARK: - Function
    @objc private func done() {
        domainText = place.domainData
        provincialText = place.provincialData
        districtText = place.districtData
        let vcHome = self.navigationController?.viewControllers[0] as! HomeViewController
        vcHome.hide = false
        vcHome.dataSource = self
        navigationController?.popToViewController(vcHome, animated: true)
    }
}

// MARK: - Extension
extension Edit3ViewController: HomeViewControllerDataSource {
    func getDomain() -> String? {
        return self.domainText
    }
    
    func getProvincial() -> String? {
        return self.provincialText
    }
    
    func getDistrict() -> String? {
        return self.districtText
    }
}
