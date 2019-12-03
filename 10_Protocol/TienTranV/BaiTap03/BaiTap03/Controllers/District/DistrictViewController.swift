//
//  DistrictViewController.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol DistrictViewControllerDatasource: class {
    func getChooseLocation() -> ChooseLocation?
}

final class DistrictViewController: BaseViewController {

    var chooseLocation: ChooseLocation?
    weak var datasource: DistrictViewControllerDatasource?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let chooseLocation = chooseLocation {
            view.subviews.forEach { (subview) in
                guard let button = subview as? UIButton else { return }
                if button.titleLabel?.text != chooseLocation.district {
                    button.backgroundColor = .white
                    button.setTitleColor(.black, for: .normal)
                } else {
                    button.backgroundColor = .systemOrange
                    button.setTitleColor(.white, for: .normal)
                }
            }
        }
    }

    override func setupUI() {
        title = "Huyện"

        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneBarButtonItem

        guard let chooseLocation = datasource?.getChooseLocation(),
            let region = DummyData.regions.first(where: { $0.name == chooseLocation.region }),
            let province = region.provinces.first(where: { $0.name == chooseLocation.province }) else { return }
        self.chooseLocation = chooseLocation
        self.view.subviews.forEach { (view) in
            guard let districtButton = view as? UIButton else { return }
            setupButton(districtButton, title: province.districts[view.tag].name)
        }
    }

    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemOrange.cgColor
    }


    @objc private func handleDone() {
        if let chooseDistrict = chooseLocation?.district, chooseDistrict != "" {
            guard let chooseLocation = chooseLocation else {
                return
            }
            chooseLocation.toString()
            guard let navi = navigationController else { return }
            for vc in navi.viewControllers where vc is LocationViewController {
                let locationVC = vc as! LocationViewController
                locationVC.datasource = self
                navi.popToViewController(locationVC, animated: true)
            }
        }
    }

    @IBAction func districtButtonTouchUpInside(_ sender: UIButton) {
        guard let district = sender.titleLabel?.text else {
            return
        }
        chooseLocation?.district = district
        view.subviews.forEach { (subview) in
            guard let button = subview as? UIButton else { return }
            if button.tag != sender.tag {
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            } else {
                button.backgroundColor = .systemOrange
                button.setTitleColor(.white, for: .normal)
            }
        }
    }
}

extension DistrictViewController: LocationViewControllerDataSource {
    func getChooseLocation() -> ChooseLocation? {
        guard let chooseLocation = chooseLocation else { return nil }
        return chooseLocation
    }
}
