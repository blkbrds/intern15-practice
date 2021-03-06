//
//  HuyenViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol HuyenViewControllerDataSource: class {
    func getMienTinh() -> (mien: String?,tinh: String?)
    func getHuyenSelected() -> String?
}

final class HuyenViewController: UIViewController {
    
    private let cellIdentifier: String = "cell"
    private var huyenSelected: Huyen?
    var huyens: [Huyen] = []
    weak var dataSource: HuyenViewControllerDataSource?
    
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
        title = "Huyen"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(popToLocationView))
    }
    
    @objc private func popToLocationView() {
        guard let navi = navigationController else { return }
        for vc in navi.viewControllers {
            if let vc = vc as? Ex3ViewController {
                vc.dataSource = self
                navi.popToViewController(vc, animated: true)
                return
            }
        }
    }
}

extension HuyenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return huyens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemRed.cgColor
        cell.textLabel?.text = huyens[indexPath.row].name
        cell.selectionStyle = .none
        if let huyen = dataSource?.getHuyenSelected() {
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

extension HuyenViewController: Ex3ViewControllerDataSource {
    func getLocation() -> (mien: String?, tinh: String?, huyen: String?) {
        return (dataSource?.getMienTinh().mien, dataSource?.getMienTinh().tinh, huyenSelected?.name)
    }
}
