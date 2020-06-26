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
        vc.datasource = self
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LocationViewController: AreaViewControllerDatasource {
    func getViewController(view: AreaViewController, location: Location) -> Location {
        return location
    }
}

extension LocationViewController: AreaViewControllerDelegate {
    func getLocationButton(locationButton: String, location: Location) {
        if location == .mien {
            mienLabel.text = locationButton
        } else if location == .tinh {
            tinhLabel.text = locationButton
        } else {
            huyenLabel.text = locationButton
        }
    }
}
