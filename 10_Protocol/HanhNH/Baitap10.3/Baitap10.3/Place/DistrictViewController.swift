//
//  DistrictViewController.swift
//  Baitap10.3
//
//  Created by ANH NGUYỄN on 11/6/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

protocol DistrctViewControllerDataSource: class {
    func getRegionCity() -> (mien: String?, tinh: String?)
    func getDistrct() -> String?
}
final class DistrictViewController: UIViewController {

    @IBOutlet weak var districtTableView: UITableView!

    weak var dataSource: DistrctViewControllerDataSource?
    var huyens: [Huyen] = []
    private var huyenSelected: Huyen?
    override func viewDidLoad() {
        super.viewDidLoad()
        districtTableView.dataSource = self
        districtTableView.delegate = self
        districtTableView.tableFooterView = UIView(frame: .zero)
        setupNavi()
        setUpUI()
    }
    
    private func setUpUI() {
        districtTableView.register(UITableViewCell.self, forCellReuseIdentifier: "distrctCell")
    }
    
    private func setupNavi() {
        title = "Tỉnh"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneDistrict))


    }
    
    @objc func doneDistrict() {
        guard let navigation = navigationController else { return }
        for vc in navigation.viewControllers {
            if let vc = vc as? PlaceViewController {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
}

extension DistrictViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return huyens.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "distrctCell", for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemRed.cgColor
        cell.textLabel?.text = huyens[indexPath.row].name
        cell.selectionStyle = .none
        if let huyen = dataSource?.getDistrct() {
            for (offset, element) in huyens.enumerated() where huyen == element.name && indexPath.row == offset {
                cell.backgroundColor = .systemRed
                huyenSelected = huyens[indexPath.row]
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemRed
        huyenSelected = huyens[indexPath.row]
        for index in 0..<huyens.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }

}
extension DistrictViewController: PlaceViewControllerDataSource {
    func getLocation() -> (mien: String?, tinh: String?, huyen: String?) {
        return (dataSource?.getRegionCity().mien, dataSource?.getRegionCity().tinh, huyenSelected?.name)
    }
}
