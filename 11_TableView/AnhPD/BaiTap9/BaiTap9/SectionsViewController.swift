//
//  SectionsViewController.swift
//  BaiTap9
//
//  Created by PCI0012 on 5/15/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

final class SectionsViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    private var homeDatas: [HomeData] = []
    var sectionIndex: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SECTIONS"
        updateData()
        configTableView()
        updateSectionIndex()
    }
    
    private func configTableView() {
        let nib = UINib(nibName: "SectionsTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
    }
    
    private func updateData() {
        guard let path = Bundle.main.url(forResource: "Items", withExtension: "plist"),
            let itemsData = NSDictionary(contentsOf: path) else {
            return
        }
        if let foods = itemsData["foods"] as? [[String: Any]] {
            var homeBundleDatas: [HomeBundleData] = []
            foods.forEach { food in
                let avatar: String = food["image"] as? String ?? ""
                let name: String = food["title"] as? String ?? ""
                let subTitle: String = food["sub-title"] as? String ?? ""
                let homeBundleData = HomeBundleData(avatar: avatar, name: name, subTitle: subTitle)
                homeBundleDatas.append(homeBundleData)
            }
            homeDatas.append(SectionsViewController.HomeData(sectionIndex: "F", name: "Foods", items: homeBundleDatas))
        }
        
        if let cattles = itemsData["castles"] as? [[String: Any]] {
            var homeBundleDatas: [HomeBundleData] = []
            cattles.forEach { castle in
                let avatar: String = castle["image"] as? String ?? ""
                let name: String = castle["title"] as? String ?? ""
                let subTitle: String = castle["sub-title"] as? String ?? ""
                let homeBundleData = HomeBundleData(avatar: avatar, name: name, subTitle: subTitle)
                homeBundleDatas.append(homeBundleData)
            }
            homeDatas.append(SectionsViewController.HomeData(sectionIndex: "C", name: "Cattles", items: homeBundleDatas))
        }
        
        if let items = itemsData["items"] as? [[String: Any]] {
            var homeBudleDatas: [HomeBundleData] = []
            items.forEach { item in
                let avatar: String = item["image"] as? String ?? ""
                let name: String = item["title"] as? String ?? ""
                let subTitle: String = item["sub-title"] as? String ?? ""
                let homeBundleData = HomeBundleData(avatar: avatar, name: name, subTitle: subTitle)
                homeBudleDatas.append(homeBundleData)
            }
            homeDatas.append(SectionsViewController.HomeData(sectionIndex: "I", name: "Items", items: homeBudleDatas))
        }
    }
    
    private func updateSectionIndex() {
        for item in homeDatas {
            sectionIndex.append(item.sectionIndex)
        }
    }
}

extension SectionsViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeDatas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeDatas[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = homeDatas[indexPath.section].items
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SectionsTableViewCell ?? SectionsTableViewCell()
        cell.homeBundleData = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return homeDatas[section].name
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndex
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension SectionsViewController {
    
    struct HomeData {
        var sectionIndex: String
        var name: String
        var items: [HomeBundleData]
    }
}
