//
//  HomeViewController.swift
//  BaiTapCusTomCell
//
//  Created by PCI0012 on 5/21/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var cafes: [HomeCellVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        loadData()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.dataSource = self
    }
    
    private func loadData() {
        guard let path = Bundle.main.url(forResource: "Sections", withExtension: "plist"), let sectionsData = NSDictionary(contentsOf: path) else {
            return
        }
        
        if let caffes = sectionsData["Caffes"] as? [[String: Any]] {
            var homeCellVMs: [HomeCellVM] = []
            caffes.forEach { caffe in
                let avatarName: String = caffe["avatarName"] as! String
                let nameTitle: String = caffe["nameTitle"] as! String
                let address: String = caffe["address"] as! String
                let homeCellVM = HomeCellVM(avatarName: avatarName, nameTiltle: nameTitle, address: address)
                homeCellVMs.append(homeCellVM)
            }
            cafes.append(contentsOf: homeCellVMs)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.homeCellVM = cafes[indexPath.row]
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cafes.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension HomeViewController: HomeCellDelegate {
    func homeCell(cell: HomeCell, didSelectRowAt index: Int) {
        let item = cafes[index].nameTitle
        print("Select \(item)")
    }
}
