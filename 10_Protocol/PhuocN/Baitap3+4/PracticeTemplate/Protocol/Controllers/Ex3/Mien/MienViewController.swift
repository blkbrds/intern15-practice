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

final class MienViewController: UIViewController {
    
    private var miens: [Mien] = locations
    private var mienSelected: Mien?
    private let cellIdentifier: String = "cell"
    weak var dataSource: MienViewControllerDataSource?
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupNavi()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView(frame: .zero)
        guard let tinhs = dataSource.ge else {
            <#statements#>
        }
    }
    
    private func setupNavi() {
        title = "Mien"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tinh", style: .plain, target: self, action: #selector(pushToNextView))
    }
    
    @objc private func pushToNextView() {
        if let mien = mienSelected {
            let vc = TinhViewController()
            vc.dataSource = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MienViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        cell.textLabel?.text = miens[indexPath.row].name
        cell.selectionStyle = .none
        if let mien = dataSource?.getMienSelected().mien {
            for (offset, element) in miens.enumerated() where mien == element.name && indexPath.row == offset {
                cell.backgroundColor = .systemBlue
                mienSelected = miens[indexPath.row]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemBlue
        mienSelected = miens[indexPath.row]
        for index in 0..<miens.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }
}

extension MienViewController: TinhViewControllerDataSource {
    func getTinhSelected() -> (tinh: String?, huyen: String?) {ß
        return (dataSource?.getMienSelected().tinh, dataSource?.getMienSelected().huyen)
    }
    
    func getMien() -> String? {
        return mienSelected?.name
    }
}
