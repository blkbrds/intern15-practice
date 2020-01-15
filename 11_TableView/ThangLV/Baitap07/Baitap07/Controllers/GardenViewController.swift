//
//  GardenViewController.swift
//  Baitap07
//
//  Created by PCI0008 on 1/13/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

class GardenViewController: UIViewController {
    
    var garden: [[String]] = []
    var gardenIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Garden"
        loadData()
        configTableView()
    }
    
    private func loadData() {
        let flowers: [String] = ["Rose", "Daisy", "Lavender", "Sun flower"]
        let vegetables: [String] = ["Cilantro", "Chilli", "Spinach", "Corn", "Herb", "Pepper", "Onion", "Bay"]
        let animals: [String] = ["Pig", "Dog", "Cat", "Cow", "Tiger", "Bird", "Duck", "Swan", "Fish", "Hippo"]
        garden = [flowers, vegetables, animals]
        gardenIndex = ["F", "V", "A"]
    }
    
    private func configTableView() {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
}

extension GardenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return garden.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = garden[indexPath.section][indexPath.row]
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}
