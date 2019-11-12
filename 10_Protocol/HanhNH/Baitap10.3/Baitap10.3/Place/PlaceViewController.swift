//
//  PlaceViewController.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
protocol PlaceViewControllerDataSource: class {
    func getLocation() -> (mien: String?, tinh: String?, huyen: String?)
}

final class PlaceViewController: UIViewController {

    weak var dataSource: PlaceViewControllerDataSource? {
        didSet {
            guard let mien = dataSource?.getLocation().mien,
                let tinh = dataSource?.getLocation().tinh,
                let huyen = dataSource?.getLocation().tinh else { return }
            huyenLabel.text = huyen
            mienLabel.text = mien
            tinhLabel.text = tinh
        }
    }

    @IBOutlet weak var huyenLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var mienLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
    }
    private func setupNavi() {
        title = "Địa điểm"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editProfile))
    }
    @objc func editProfile() {
        let vc = RegionViewController()
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlaceViewController: RegionViewControllerDataSource {
    func getRegionSelected() -> (mien: String?, tinh: String?, huyen: String?) {
        return(mienLabel.text, tinhLabel.text, huyenLabel.text)
    }
}
