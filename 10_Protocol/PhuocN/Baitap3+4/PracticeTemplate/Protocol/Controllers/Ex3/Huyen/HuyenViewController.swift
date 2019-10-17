//
//  HuyenViewController.swift
//  Protocol
//
//  Created by PhuocNguyen on 10/16/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol HuyenViewControllerDataSource: class {
    //func submitLocation(mien: String, tinh: String, huyen: String)
    func getMienTinh() -> (mien: String?,tinh: String?)
    func getHuyenSelected() -> String?
}

class HuyenViewController: UIViewController {
    
    private let cellIdentifier: String = "cell"
    var huyenSelected: Huyen?
    weak var dataSource: HuyenViewControllerDataSource?
    var data: [Huyen] = []
    
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
        self.title = "Huyen"
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemRed.cgColor
        cell.textLabel?.text = data[indexPath.row].name
        cell.selectionStyle = .none
        data.enumerated().forEach {
            if let huyen = dataSource?.getHuyenSelected(), $1.name == huyen && indexPath.row == $0 {
                cell.backgroundColor = .systemRed
                huyenSelected = data[indexPath.row]
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemRed
        huyenSelected = data[indexPath.row]
        for index in 0..<data.count where index != indexPath.row {
            tableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = .white
        }
    }
}

extension HuyenViewController: Ex3ViewControllerDataSource {
    func getLocation() -> (mien: String?, tinh: String?, huyen: String?) {
        return (dataSource?.getMienTinh().mien, dataSource?.getMienTinh().tinh, huyenSelected?.name)
    }
}
