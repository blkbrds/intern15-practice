//
//  HomeViewController.swift
//  BaiTap09
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var myTableView: UITableView!

  private var somethings: [[String]] = []
  private let sectionNames: [String] = ["Con vat", "Do vat", "Xe co"]

  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
    setupUI()
  }

  private func setupData() {
    somethings = [
      ["Heo", "Ga", "Trau", "Bo", "De"],
      ["Ti vi", "Tu lanh", "Quat", "Den", "Dieu hoa"],
      ["Mo to", "O to", "Xe dap", "Xa tai"]
    ]
  }

  private func setupUI() {
    title = "Sections"
    loadNib()
  }

  private func loadNib() {
    let nib = UINib(nibName: "MyTableViewCell", bundle: .main)
    myTableView.register(nib, forCellReuseIdentifier: "myCell")
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionNames[section]
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return somethings.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return somethings[section].count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
    cell.userSubtitle.text = somethings[indexPath.section][indexPath.row]
    cell.userSubtitle.text = "Sub title"
    cell.indexSelect = indexPath.row
    cell.accessoryType = .detailButton
    cell.editingAccessoryType = .detailButton
    return cell
  }

  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return sectionNames.map({ ($0.first?.uppercased())! })
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    print(indexPath.row)
  }
}
