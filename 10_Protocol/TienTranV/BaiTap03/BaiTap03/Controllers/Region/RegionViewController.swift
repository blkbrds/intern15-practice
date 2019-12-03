//
//  RegionViewController.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol RegionViewControllerDatasource: class {
    func getChooseLocation() -> ChooseLocation?
}

final class RegionViewController: BaseViewController {

    var chooseLocation: ChooseLocation?
    weak var datasource: RegionViewControllerDatasource?

    private var region: Region?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let chooseLocation = datasource?.getChooseLocation() {
            self.chooseLocation = chooseLocation
            view.subviews.forEach { (subview) in
                guard let button = subview as? UIButton else { return }
                if button.titleLabel?.text != chooseLocation.region {
                    button.backgroundColor = .white
                    button.setTitleColor(.black, for: .normal)
                } else {
                    button.backgroundColor = .systemBlue
                    button.setTitleColor(.white, for: .normal)
                }
            }
        }
    }

    override func setupUI() {
        title = "Miền"

        let provinceBarButtonItem = UIBarButtonItem(title: "Tỉnh", style: .done, target: self, action: #selector(handleProvince))
        navigationItem.rightBarButtonItem = provinceBarButtonItem

        self.view.subviews.forEach { (subview) in
            guard let button = subview as? UIButton else { return }
            setupButton(button, title: DummyData.regions[subview.tag].name)
        }
    }

    private func setupButton(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.systemBlue.cgColor
    }

    @objc private func handleProvince() {
        if let chooseRegion = chooseLocation?.region, chooseRegion != "" {
            let provinceVC = ProvinceViewController()
            provinceVC.datasource = self
            navigationController?.pushViewController(provinceVC, animated: true)
        }
    }

    @IBAction func regionButtonTouchUpInside(_ sender: UIButton) {
        guard let region = sender.titleLabel?.text else {
            return
        }
        chooseLocation?.region = region
        view.subviews.forEach { (subview) in
            guard let button = subview as? UIButton else { return }
            if button.tag != sender.tag {
                button.backgroundColor = .white
                button.setTitleColor(.black, for: .normal)
            } else {
                button.backgroundColor = .systemBlue
                button.setTitleColor(.white, for: .normal)
            }
        }
    }
}

extension RegionViewController: ProvinceViewControllerDatasource {
    func getChooseLocation() -> ChooseLocation? {
        return chooseLocation
    }
}
