//
//  MienViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MienViewControllerDataSource: class {
    func getMienSelected() -> (mien: String?, tinh: String?, huyen: String?)
}

class MienViewController: UIViewController {
    
    private let cellIdentifier: String = "cell"
    weak var dataSource: MienViewControllerDataSource?
    
    @IBOutlet private weak var tableView: UITableView!
    
    var data: [Mien] = miens
    var mienSelected: Mien?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupNavi()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    
    private func setupNavi() {
        self.title = "Mien"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tinh", style: .plain, target: self, action: #selector(pushToNextView))
    }
    
    @objc private func pushToNextView() {
        let vc = TinhViewController()
        if let mien = mienSelected {
            vc.data = mien.tinh
            vc.dataSource = self
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MienViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        cell.textLabel?.text = data[indexPath.row].name
        cell.selectionStyle = .none
        if let mien = dataSource?.getMienSelected().mien {
            for (offset, element) in data.enumerated() where mien == element.name && indexPath.row == offset{
                cell.backgroundColor = .systemBlue
                mienSelected = data[indexPath.row]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemBlue
        mienSelected = data[indexPath.row]
        for index in 0..<data.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }
}

extension MienViewController: TinhViewControllerDataSource {
    func getTinhSelected() -> (tinh: String?, huyen: String?) {
        return (dataSource?.getMienSelected().tinh, dataSource?.getMienSelected().huyen)
    }
    
    func getMien() -> String? {
        return mienSelected?.name
    }
}
