//
//  LocationViewController.swift
//  BaiTap03
//
//  Created by TranVanTien on 11/30/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

protocol LocationViewControllerDataSource: class {
    func getChooseLocation() -> ChooseLocation?
}

final class LocationViewController: BaseViewController {

    @IBOutlet private weak var regionLabel: UILabel!
    @IBOutlet private weak var provinceLabel: UILabel!
    @IBOutlet private weak var districtLabel: UILabel!
    
    var chooseLocation: ChooseLocation?
    weak var datasource: LocationViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let chooseLocation = datasource?.getChooseLocation() {
            self.chooseLocation = chooseLocation
            regionLabel.text = chooseLocation.region
            provinceLabel.text = chooseLocation.province
            districtLabel.text = chooseLocation.district
        }
    }

    override func setupUI() {
        title = "Địa điểm"
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(handleEditBarButtonItem))
        navigationItem.rightBarButtonItem = editBarButtonItem
    }

    @objc private func handleEditBarButtonItem() {
        let regionVC = RegionViewController()
        regionVC.datasource = self
        navigationController?.pushViewController(regionVC, animated: true)
    }
}

extension LocationViewController: RegionViewControllerDatasource {
    func getChooseLocation() -> ChooseLocation?{
        guard let region = regionLabel.text, let province = provinceLabel.text, let district = districtLabel.text else { return nil}
        chooseLocation = ChooseLocation(chooseRegion: region, chooseProvince: province, chooseDistrict: district)
        return chooseLocation
    }
}

struct DummyData {

    static var regions: [Region] = {
        let regions = [
            Region(regionName: "Miền 1",
                provinces: [
                    Province(provinceName: "Tỉnh 1.1",
                        districts: [
                            District(districtName: "Huyện 1.1.1"),
                            District(districtName: "Huyện 1.1.2"),
                            District(districtName: "Huyện 1.1.3"),
                            District(districtName: "Huyện 1.1.4"),
                            District(districtName: "Huyện 1.1.5")
                        ]),
                    Province(provinceName: "Tỉnh 1.2",
                        districts: [
                            District(districtName: "Huyện 1.2.1"),
                            District(districtName: "Huyện 1.2.2"),
                            District(districtName: "Huyện 1.2.3"),
                            District(districtName: "Huyện 1.2.4"),
                            District(districtName: "Huyện 1.2.5")
                        ]),
                    Province(provinceName: "Tỉnh 1.3",
                        districts: [
                            District(districtName: "Huyện 1.3.1"),
                            District(districtName: "Huyện 1.3.2"),
                            District(districtName: "Huyện 1.3.3"),
                            District(districtName: "Huyện 1.3.4"),
                            District(districtName: "Huyện 1.3.5")
                        ]),
                    Province(provinceName: "Tỉnh 1.4",
                        districts: [
                            District(districtName: "Huyện 1.4.1"),
                            District(districtName: "Huyện 1.4.2"),
                            District(districtName: "Huyện 1.4.3"),
                            District(districtName: "Huyện 1.4.4"),
                            District(districtName: "Huyện 1.4.5")
                        ]),
                    Province(provinceName: "Tỉnh 1.5",
                        districts: [
                            District(districtName: "Huyện 1.5.1"),
                            District(districtName: "Huyện 1.5.2"),
                            District(districtName: "Huyện 1.5.3"),
                            District(districtName: "Huyện 1.5.4"),
                            District(districtName: "Huyện 1.5.5")
                        ]),
                    Province(provinceName: "Tỉnh 1.6",
                        districts: [
                            District(districtName: "Huyện 1.6.1"),
                            District(districtName: "Huyện 1.6.2"),
                            District(districtName: "Huyện 1.6.3"),
                            District(districtName: "Huyện 1.6.4"),
                            District(districtName: "Huyện 1.6.5")
                        ]),
                ]),
            Region(regionName: "Miền 2",
                provinces: [
                    Province(provinceName: "Tỉnh 2.1",
                        districts: [
                            District(districtName: "Huyện 2.1.1"),
                            District(districtName: "Huyện 2.1.2"),
                            District(districtName: "Huyện 2.1.3"),
                            District(districtName: "Huyện 2.1.4"),
                            District(districtName: "Huyện 2.1.5")
                        ]),
                    Province(provinceName: "Tỉnh 2.2",
                        districts: [
                            District(districtName: "Huyện 2.2.1"),
                            District(districtName: "Huyện 2.2.2"),
                            District(districtName: "Huyện 2.2.3"),
                            District(districtName: "Huyện 2.2.4"),
                            District(districtName: "Huyện 2.2.5")
                        ]),
                    Province(provinceName: "Tỉnh 2.3",
                        districts: [
                            District(districtName: "Huyện 2.3.1"),
                            District(districtName: "Huyện 2.3.2"),
                            District(districtName: "Huyện 2.3.3"),
                            District(districtName: "Huyện 2.3.4"),
                            District(districtName: "Huyện 2.3.5")
                        ]),
                    Province(provinceName: "Tỉnh 2.4",
                        districts: [
                            District(districtName: "Huyện 2.4.1"),
                            District(districtName: "Huyện 2.4.2"),
                            District(districtName: "Huyện 2.4.3"),
                            District(districtName: "Huyện 2.4.4"),
                            District(districtName: "Huyện 2.4.5")
                        ]),
                    Province(provinceName: "Tỉnh 2.5",
                        districts: [
                            District(districtName: "Huyện 2.5.1"),
                            District(districtName: "Huyện 2.5.2"),
                            District(districtName: "Huyện 2.5.3"),
                            District(districtName: "Huyện 2.5.4"),
                            District(districtName: "Huyện 2.5.5")
                        ]),
                    Province(provinceName: "Tỉnh 2.6",
                        districts: [
                            District(districtName: "Huyện 2.6.1"),
                            District(districtName: "Huyện 2.6.2"),
                            District(districtName: "Huyện 2.6.3"),
                            District(districtName: "Huyện 2.6.4"),
                            District(districtName: "Huyện 2.6.5")
                        ]),
                ]),
            Region(regionName: "Miền 3",
                provinces: [
                    Province(provinceName: "Tỉnh 3.1",
                        districts: [
                            District(districtName: "Huyện 3.1.1"),
                            District(districtName: "Huyện 3.1.2"),
                            District(districtName: "Huyện 3.1.3"),
                            District(districtName: "Huyện 3.1.4"),
                            District(districtName: "Huyện 3.1.5")
                        ]),
                    Province(provinceName: "Tỉnh 3.2",
                        districts: [
                            District(districtName: "Huyện 3.2.1"),
                            District(districtName: "Huyện 3.2.2"),
                            District(districtName: "Huyện 3.2.3"),
                            District(districtName: "Huyện 3.2.4"),
                            District(districtName: "Huyện 3.2.5")
                        ]),
                    Province(provinceName: "Tỉnh 3.3",
                        districts: [
                            District(districtName: "Huyện 3.3.1"),
                            District(districtName: "Huyện 3.3.2"),
                            District(districtName: "Huyện 3.3.3"),
                            District(districtName: "Huyện 3.3.4"),
                            District(districtName: "Huyện 3.3.5")
                        ]),
                    Province(provinceName: "Tỉnh 3.4",
                        districts: [
                            District(districtName: "Huyện 3.4.1"),
                            District(districtName: "Huyện 3.4.2"),
                            District(districtName: "Huyện 3.4.3"),
                            District(districtName: "Huyện 3.4.4"),
                            District(districtName: "Huyện 3.4.5")
                        ]),
                    Province(provinceName: "Tỉnh 3.5",
                        districts: [
                            District(districtName: "Huyện 3.5.1"),
                            District(districtName: "Huyện 3.5.2"),
                            District(districtName: "Huyện 3.5.3"),
                            District(districtName: "Huyện 3.5.4"),
                            District(districtName: "Huyện 3.5.5")
                        ]),
                    Province(provinceName: "Tỉnh 3.6",
                        districts: [
                            District(districtName: "Huyện 3.6.1"),
                            District(districtName: "Huyện 3.6.2"),
                            District(districtName: "Huyện 3.6.3"),
                            District(districtName: "Huyện 3.6.4"),
                            District(districtName: "Huyện 3.6.5")
                        ])
                ])
        ]
        return regions
    }()
}
