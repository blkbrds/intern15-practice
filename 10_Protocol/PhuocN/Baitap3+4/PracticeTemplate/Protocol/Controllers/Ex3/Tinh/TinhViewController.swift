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

final class TinhViewController: UIViewController {
    
    private let cellIdentifier: String = "cell"
    weak var dataSource: TinhViewControllerDataSource?
    var tinhs: [Tinh] = []
    private var tinhSelected: Tinh?
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView(frame: .zero)
        setupNavi()
    }
    
    private func setupNavi() {
        title = "Tinh"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Huyen", style: .plain, target: self, action: #selector(pushToNextView))
    }
    
    @objc private func pushToNextView() {
        guard let tinh = tinhSelected else { return }
        let vc = HuyenViewController()
        vc.dataSource = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TinhViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tinhs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemGreen.cgColor
        cell.textLabel?.text = tinhs[indexPath.row].name
        cell.selectionStyle = .none
        if let tinh = dataSource?.getTinhSelected().tinh {
            for (offset, element) in tinhs.enumerated() where tinh == element.name && indexPath.row == offset {
                cell.backgroundColor = .systemGreen
                tinhSelected = tinhs[indexPath.row]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemGreen
        tinhSelected = tinhs[indexPath.row]
        for index in 0..<tinhs.count where index != indexPath.row {
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
