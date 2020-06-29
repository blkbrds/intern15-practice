//
//  ListSectionsViewController.swift
//  TableView
//
//  Created by PCI0019 on 6/29/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

//import UIKit

//class ListSectionsViewController: UIViewController {
//
//    @IBOutlet weak var listSection: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "SECTIONS"
//        configData()
//        loadData()
//    }
//    func loadData() {
//        guard let path = Bundle.main.url(forResource: "Section", withExtension: "plist"), let contactData = NSArray(contentsOf: path) as? [[String: String]] else { return }
//        for i in contactData {
//            guard let item = i["item"], let value = i["value"] else { return }
//            let section = SectionList(item: item, value: value)
////            sectionList.append(section)
////            sectionList = contactData
//        }
//        //sectionList = contactData
//
//    }
//    func configData() {
//        listSection.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
//        listSection.dataSource = self
//    }
//}
//extension ListSectionsViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//       // return sectionList.count
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
//      //  cell.textLabel?.text = "\(sectionList[indexPath.row])"
//        return cell
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "Section0 "
//        case 1:
//            return "Section1"
//        default:
//            return "Section2"
//        }
//    }
//}
