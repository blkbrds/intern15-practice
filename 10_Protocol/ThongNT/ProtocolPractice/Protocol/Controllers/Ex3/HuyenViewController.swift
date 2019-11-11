//
//  HuyenViewController.swift
//  Protocol
//
//  Created by PCI0018 on 11/5/19.
//

import UIKit

protocol HuyenViewControllerDataSource: class {
    func getLocation() -> Location?
    func getDistricts() -> [District]
}

final class HuyenViewController: UIViewController {

    enum Action {
        case sendLocation (location: Location)
    }

    @IBOutlet weak var tableView: UITableView!

    weak var dataSource: HuyenViewControllerDataSource?
    private var districts: [District] = []
    private var location: Location = Location()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "District"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(updateLocation))
        navigationItem.rightBarButtonItem = doneButton
        setupData()
        setupUI()
    }

    private func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "districtCells")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupData() {
        if let location = dataSource?.getLocation(), let districts = dataSource?.getDistricts() {
            self.location = location
            self.districts = districts
        }
    }

    // function thay đổi địa điểm
    @objc func updateLocation() {
        guard let locationViewController = navigationController else { return }
        for vc in locationViewController.viewControllers {
            if let vc = vc as? Ex3ViewController {
                vc.dataSource = self
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
}

extension HuyenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "districtCells", for: indexPath)
        cell.textLabel?.text = districts[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        location.district = districts[indexPath.row].name
    }
}

extension HuyenViewController: Ex3ViewControllerDataSource {
    func getLocation() -> Location {
        return location
    }
}
