//
//  SectionsViewController.swift
//  BaiTap6
//
//  Created by PCI0012 on 5/15/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {

    @IBOutlet weak var sectionsTableView: UITableView!
    
	var cattles: [String] = []
	var items: [String] = []
	var foods: [String] = []
	var titlesSection: [String] = ["Cattles", "Items","Foods"]
	var sections: [[String]] = []
	var sectionIndex: [String] = ["C","I","F"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        updateData()
		let nib = UINib(nibName: "NamesTableViewCell", bundle: .main)
		sectionsTableView.register(nib, forCellReuseIdentifier: "cell")
		sectionsTableView.dataSource = self
		sectionsTableView.delegate = self
    }
    
    func updateData() {
        guard let path = Bundle.main.url(forResource: "Cattle", withExtension: "plist") else {
            return
        }
        guard let cattlesData = NSArray(contentsOf: path) as? [String] else {
            return
        }
        guard let path1 = Bundle.main.url(forResource: "Items", withExtension: "plist") else {
            return
        }
        guard let itemsData = NSArray(contentsOf: path1) as? [String] else {
            return
        }
		guard let path2 = Bundle.main.url(forResource: "Foods", withExtension: "plist") else {
			return
		}
		guard let foosData = NSArray(contentsOf: path2) as? [String] else {
			return
		}
		
		cattles = cattlesData
		items = itemsData
		foods = foosData
		sections = [cattles, items, foods]
    }
}

extension SectionsViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return titlesSection.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = sectionsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NamesTableViewCell ?? NamesTableViewCell()
		cell.nameLabel.text = sections[indexPath.section][indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return titlesSection[section]
	}
	
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return sectionIndex
	}
	
	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		return index
	}
}
