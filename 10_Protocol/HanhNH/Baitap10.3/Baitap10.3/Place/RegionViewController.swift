//
//  RegionViewController.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
protocol RegionViewControllerDataSource: class {
    func getRegionSelected() -> (mien: String?, tinh: String?, huyen: String?)
}

final class RegionViewController: UIViewController {

    private var regions: [Region] = location
    private var regionSelected: Region?
    weak var dataSource: RegionViewControllerDataSource?
    @IBOutlet weak var regionTabveView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        regionTabveView.delegate = self
        regionTabveView.dataSource = self
        setupNavi()
        setupUI()
    }
    private func setupUI() {
        regionTabveView.register(UITableViewCell.self, forCellReuseIdentifier: "regionCell")
        regionTabveView.dataSource = self
    }
    private func setupNavi() {
        title = "Miền"
        let tinhButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(tinhRegion))
        navigationItem.rightBarButtonItem = tinhButton

    }
    @objc func tinhRegion() {
        if let mien = regionSelected {
            let vc = CityViewController()
            vc.citys = mien.tinh
            vc.dataSource = self
            navigationController?.pushViewController(vc, animated: true)
        }

    }
}
extension RegionViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        cell.textLabel?.text = regions[indexPath.row].name
        cell.selectionStyle = .none
        if let mien = dataSource?.getRegionSelected().mien {
            for (offset, element) in regions.enumerated() where mien == element.name && indexPath.row == offset {
                cell.backgroundColor = .systemBlue
                regionSelected = regions[indexPath.row]
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemBlue
        regionSelected = regions[indexPath.row]
        for index in 0..<regions.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }
}
extension RegionViewController: CityViewControllerDataSource {
    func getRegion() -> String? {
        return regionSelected?.name
    }
    func getTinhSelected() -> (tinh: String?, huyen: String?) {
        return (dataSource?.getRegionSelected().tinh, dataSource?.getRegionSelected().huyen)
    }

}
