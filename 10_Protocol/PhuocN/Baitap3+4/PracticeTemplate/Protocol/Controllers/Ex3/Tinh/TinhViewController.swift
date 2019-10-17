//
//  TinhViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol TinhViewControllerDataSource: class {
    func getMien() -> String?
    func getTinhSelected() -> (tinh: String?, huyen: String?)
}

class TinhViewController: UIViewController {
    
    weak var dataSource: TinhViewControllerDataSource?
    @IBOutlet private weak var tableView: UITableView!
    var data: [Tinh] = []
    var tinhSelected: Tinh?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView(frame: .zero)
        setupNavi()
    }
    
    func setupNavi() {
        self.title = "Tinh"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Huyen", style: .plain, target: self, action: #selector(pushToNextView))
    }
    
    @objc func pushToNextView() {
        let vc = HuyenViewController()
        guard let tinh = tinhSelected else { return }
        vc.data = tinh.huyen
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TinhViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGreen.cgColor
        cell.textLabel?.text = data[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemGreen
        tinhSelected = data[indexPath.row]
        for index in 0..<data.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }
}

extension TinhViewController: HuyenViewControllerDataSource {
    func getHuyenSelected() -> String? {
        return dataSource?.getTinhSelected().huyen
    }
    
    func getMienTinh() -> (mien: String?, tinh: String?) {
        return (dataSource?.getMien(),tinhSelected?.name)
    }
}
