//
//  ProvinceViewController.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol ProvinceViewControllerDatasource: class {
    func getChooseLocation() -> ChooseLocation?
}

final class ProvinceViewController: BaseViewController {

    var chooseLocation: ChooseLocation?
    weak var datasource: ProvinceViewControllerDatasource?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let chooseLocation = chooseLocation {
            view.subviews.forEach { (subview) in
                guard let button = subview as? UIButton else { return }
                if button.titleLabel?.text != chooseLocation.province {
                    button.backgroundColor = .white
                    button.setTitleColor(.black, for: .normal)
                } else {
                    button.backgroundColor = .systemGreen
                    button.setTitleColor(.white, for: .normal)
                }
            }
        }
    }

    override func setupUI() {
        title = "Tỉnh"

        let districtBarButtonItem = UIBarButtonItem(title: "Huyện", style: .done, target: self, action: #selector(handleDistrict))
        navigationItem.rightBarButtonItem = districtBarButtonItem

        guard let chooseLocation = datasource?.getChooseLocation(), let region = DummyData.regions.first(where: { $0.name == chooseLocation.region }) else { return }
        self.chooseLocation = chooseLocation
        self.view.subviews.forEach { (subview) in
            guard let provinceButton = subview as? UIButton else { return }
            setupButton(provinceButton, title: region.provinces[subview.tag].name)
        }
    }

    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemGreen.cgColor
    }

    @objc private func handleDistrict() {
        if let chooseProvince = chooseLocation?.province, chooseProvince != "" {
            let districtVC = DistrictViewController()
            districtVC.datasource = self
            navigationController?.pushViewController(districtVC, animated: true)
        }
    }

    @IBAction func provinceButtonTouchUpInside(_ sender: UIButton) {
        guard let province = sender.titleLabel?.text else {
            return
        }
        chooseLocation?.province = province
        view.subviews.forEach { (subview) in
            guard let button = subview as? UIButton else { return }
            if button.tag != sender.tag {
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            } else {
                button.backgroundColor = .systemGreen
                button.setTitleColor(.white, for: .normal)
            }
        }
    }
}

extension ProvinceViewController: DistrictViewControllerDatasource {
    func getChooseLocation() -> ChooseLocation? {
        return chooseLocation
    }
}
