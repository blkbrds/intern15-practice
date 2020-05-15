//
//  SectionsViewController.swift
//  BaiTap4
//
//  Created by PCI0012 on 5/13/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {

    @IBOutlet weak var sectionTableView: UITableView!
    
    var animals: [String] = []
    var devices: [String] = []
    var foods: [String] = []
    var sections: [[String]] = []
    var tiltesSection: [String] = ["Section 0", "Section 1", "Section 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Section"
        loadData()
        sectionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        sectionTableView.dataSource = self
        sectionTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        guard let path = Bundle.main.url(forResource: "Animals", withExtension: "plist") else {
            return
        }
        guard let animalsData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        
        guard  let path1 = Bundle.main.url(forResource: "Devices", withExtension: "plist") else {
            return
        }
        guard let devicesData = NSArray(contentsOf: path1) as? [String] else {
            return
        }
        
        guard  let path2 = Bundle.main.url(forResource: "Foods", withExtension: "plist") else {
            return
        }
        guard let foodsData = NSArray(contentsOf: path2) as? [String] else {
            return
        }
        animals = animalsData
        devices = devicesData
        foods = foodsData
        sections = [animals, devices, foods]
    }
}

extension SectionsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tiltesSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sectionTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("A: \(sections[indexPath.section][indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tiltesSection[section]
    }
}


