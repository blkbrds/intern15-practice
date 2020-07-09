//
//  LocationViewController.swift
//  Protocol
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        setupView()
    }
    
    func setupView() {
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func editButtonTouchUpInside() {
        let vc = AreaViewController()
        vc.area = .mien
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LocationViewController: AreaViewControllerDelegate {
    func passChooseLocation(viewController: AreaViewController, locationButton: String) {
        switch viewController.area  {
        case .mien:
            mienLabel.text = locationButton
        case .huyen:
            huyenLabel.text = locationButton
        case .tinh:
            tinhLabel.text = locationButton
        }
    }
}
