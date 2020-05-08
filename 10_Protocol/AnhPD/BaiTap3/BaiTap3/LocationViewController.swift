//
//  LocationViewController.swift
//  BaiTap3
//
//  Created by PCI0012 on 5/7/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

protocol LocationViewControllerDataSource: class {
    func getDomain() -> String
    func getProvince() -> String
    func getDistrict() -> String
}

class LocationViewController: UIViewController {
    
    @IBOutlet weak var domainTextField: UITextField!
    @IBOutlet weak var provinceTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    
    var domain: String = ""
    var province: String = ""
    var district: String = ""
    
    weak var dataSource: LocationViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        configNavigationBar()
//        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    private func setupUI() {
        domainTextField.text = dataSource?.getDomain()
        provinceTextField.text = dataSource?.getProvince()
        districtTextField.text = dataSource?.getDistrict()
    }
    
//    private func updateUI() {
//        if let dataSource = dataSource {
//            domain = dataSource.getDomain()
//            province = dataSource.getProvince()
//            district = dataSource.getDistrict()
//        }
//    }
    
    func configNavigationBar() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUnInSide))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func editButtonTouchUnInSide() {
        if let navigationController = navigationController {
            let vc = DomainViewController()
            navigationController.pushViewController(vc, animated: true)
        }
    }
}

