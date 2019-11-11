//
//  TinhViewController.swift
//  Protocol
//
//  Created by PCI0018 on 11/5/19.
//

import UIKit

protocol TinhViewControllerDataSource: class {
    func getLocation() -> Location?
    func getCities() -> [City]
}

final class TinhViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    weak var dataSource: TinhViewControllerDataSource?
    private var location: Location = Location()
    private var citySelected: City?
    private var cities: [City] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "City"
        let districtButton = UIBarButtonItem(title: "District", style: .plain, target: self, action: #selector(changeDistrict))
        navigationItem.rightBarButtonItem = districtButton
        setupUI()
        setupData()
    }

    private func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Thong")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupData() {
        if let location = dataSource?.getLocation(), let cities = dataSource?.getCities() {
            self.location = location
            self.cities = cities
        }
    }

    // function thay đổi quận/ huyện
    @objc private func changeDistrict() {
        let vc = HuyenViewController()
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TinhViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Thong", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        citySelected = cities[indexPath.row]
        location.city = cities[indexPath.row].name
    }
}

extension TinhViewController: HuyenViewControllerDataSource {
    func getDistricts() -> [District] {
        var districts: [District] = []
        for item in cities where item.name == citySelected?.name {
            districts = item.district
        }
        return districts
    }

    func getLocation() -> Location? {
        return location
    }
}
