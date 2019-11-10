//
//  CityViewController.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
protocol CityViewControllerDataSource: class {
    func getRegion() -> String?
    func getTinhSelected() -> (tinh: String?, huyen: String?)
}
final class CityViewController: UIViewController {

    @IBOutlet weak var citysTableView: UITableView!
    weak var dataSource: CityViewControllerDataSource?
    var citys: [Tinh] = []
    private var citysDistrict: Tinh?
    override func viewDidLoad() {
        super.viewDidLoad()
        citysTableView.dataSource = self
        citysTableView.delegate = self
        setupNavi()
        setUpUI()

    }
    private func setUpUI() {
        citysTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cityCell")

        citysTableView.dataSource = self
    }
    private func setupNavi() {
        title = "Tỉnh"
        let tinhButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(districtCity))
        navigationItem.rightBarButtonItem = tinhButton

    }
    @objc func districtCity() {
        guard let city = citysDistrict else { return }
        let vc = DistrictViewController()
        vc.huyens = city.huyen
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension CityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGreen.cgColor
        cell.textLabel?.text = citys[indexPath.row].name
        cell.selectionStyle = .none
        if let tinh = dataSource?.getTinhSelected().tinh {
            for (offset, element) in citys.enumerated() where tinh == element.name && indexPath.row == offset {
                cell.backgroundColor = .systemGreen
                citysDistrict = citys[indexPath.row]
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemBlue
        citysDistrict = citys[indexPath.row]
        for index in 0..<citys.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }
}
extension CityViewController: DistrctViewControllerDataSource {
    func getRegionCity() -> (mien: String?, tinh: String?) {
        return (dataSource?.getRegion(), citysDistrict?.name)
    }

    func getDistrct() -> String? {
        return dataSource?.getTinhSelected().huyen
    }
}
