//
//  HomeViewController.swift
//  Baitap01_02_03_04
//
//  Created by PCI0008 on 1/13/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var animals: [String] = []
    private var foods: [String] = []
    private var homeTools: [String] = []
    private var tableViewDatas: [[String]] = [[]]
    
    private let cellIdentifier: String = "UITableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        loadData()
        configTableView()
        tableViewDatas = [animals, foods, homeTools]
    }
    
    private func loadData() {
        guard let firstPath = Bundle.main.url(forResource: "Animals", withExtension: "plist") else { return }
        guard let animalsData = NSArray(contentsOf: firstPath) as? [String] else { return }
        animals = animalsData
        guard let secondPath = Bundle.main.url(forResource: "Foods", withExtension: "plist") else { return }
        guard let foodsData = NSArray(contentsOf: secondPath) as? [String] else { return }
        foods = foodsData
        guard let thirdPath = Bundle.main.url(forResource: "HomeTools", withExtension: "plist") else { return }
        guard let homeToolsData = NSArray(contentsOf: thirdPath) as? [String] else { return }
        homeTools = homeToolsData
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDatas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDatas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = tableViewDatas[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Animals"
        case 1:
             return "Foods"
        case 2:
            return "Home Tools"
        default:
            return ""
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animalDetailViewController = AnimalDetailViewController()
        animalDetailViewController.animalName = tableViewDatas[indexPath.section][indexPath.row]
        navigationController?.pushViewController(animalDetailViewController, animated: true)
    }
}
