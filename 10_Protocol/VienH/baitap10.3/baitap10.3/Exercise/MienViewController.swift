//
//  MienViewController.swift
//  baitap10.3
//
//  Created by user on 12/16/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit
protocol MienViewControllerDataSource: class {
    func getLocation() -> Location
}

final class MienViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var dataSource: MienViewControllerDataSource?
    private var states: [State] = locations
    private var stateSelected: State?
    private var location: Location = Location()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Miền"
        let cityButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(changeCity))
        navigationItem.rightBarButtonItem = cityButton
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "stateCells")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupData() {
        guard let getLocation = self.dataSource?.getLocation() else { return }
        location = getLocation
    }

    // function thay đổi tỉnh/thành phố
    @objc private func changeCity() {
        let vc = TinhViewController()
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MienViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCells", for: indexPath)
        cell.textLabel?.text = locations[indexPath.row].name
        return cell
    }
}

extension MienViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        stateSelected = states[indexPath.row]
        location.state = states[indexPath.row].name
    }
}

extension MienViewController: TinhViewControllerDataSource {
    func getLocation() -> Location? {
        return location
    }

    func getCities() -> [City] {
        var cities: [City] = []
        for item in states where item.name == stateSelected?.name {
            cities = item.city
        }
        return cities
    }
}
