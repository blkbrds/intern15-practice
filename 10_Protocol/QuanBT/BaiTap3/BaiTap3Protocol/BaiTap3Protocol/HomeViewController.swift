//
//  HomeViewController.swift
//  BaiTap3Protocol
//
//  Created by Sếp Quân on 3/30/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol HomeViewControllerDataSource: class {
    func getDomain() -> String?
    func getProvincial() -> String?
    func getDistrict() -> String?
}

final class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var domainLabel: UILabel!
    @IBOutlet private weak var provincialLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    // MARK: - Properties
    var hide = true
    weak var dataSource: HomeViewControllerDataSource?
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Địa Điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editButton
        if hide == true {
            domainLabel.text = ""
            provincialLabel.text = ""
            districtLabel.text = ""
        } else {
            domainLabel.text = dataSource?.getDomain()
            provincialLabel.text = dataSource?.getProvincial()
            districtLabel.text = dataSource?.getDistrict()
        }
    }
    
    // MARK: - Function
    @objc private func edit() {
        let vcEdit1 = Edit1ViewController()
        self.navigationController?.pushViewController(vcEdit1, animated: true)
    }
}
