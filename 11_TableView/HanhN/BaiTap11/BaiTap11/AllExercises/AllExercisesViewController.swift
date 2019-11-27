//
//  AllExercisesViewController.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/26/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class AllExercisesViewController: UIViewController {
    
    var allExercises: [String] = []
    var search: [String] = []

    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configSearchbar()
        confiNavigationBar()
        loaData()
        
    }
    // loadata cho file plist
    func loaData() {
        guard let path = Bundle.main.url(forResource: "allExercises", withExtension: "plist")
            else { return }
        guard let contractData = NSArray(contentsOf: path) as? [String]
            else { return }
        allExercises = contractData
        search = allExercises
    }

    func configTableView() {
        tabelView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tabelView.dataSource = self
        tabelView.delegate = self
        
        let nib = UINib(nibName: "ContractTableViewCell", bundle: Bundle.main)
        tabelView.register(nib, forCellReuseIdentifier: "ContractTableViewCell")
        tabelView.dataSource = self
        tabelView.delegate = self
    }

   func configSearchbar() {
        searchBar.delegate = self
    }
    
    func search(keyword: String) {
        search = getContracts(keyword: keyword)
        tabelView.reloadData()
    }
    
    func getContracts(keyword: String) -> [String] {
        if keyword.trimmingCharacters(in: CharacterSet(charactersIn: "")) == "" {
            return allExercises
        } else {
            var data: [String] = []
            for contract in allExercises {
                if let _ = contract.range(of: keyword) {
                    data.append(contract)
                }
            }
            return data
        }
    }
    
    func confiNavigationBar() {
        title = "Phonebook"
        turnOffEditingMode()
    }
    
    @objc func tunrnOnEditingMode() {
        tabelView.isEditing = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(turnOffEditingMode))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func turnOffEditingMode() {
        tabelView.isEditing = false
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(tunrnOnEditingMode))
        navigationItem.rightBarButtonItem = editButton
    }
}
extension AllExercisesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return search.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "\(search[indexPath.row])"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContractTableViewCell", for: indexPath) as! ContractTableViewCell
        cell.updateTableCell(avatar: "goku", contactName: search[indexPath.row], subtile: "Người mạnh nhất vủ trụ 11")
        return cell
    }
    
}

extension AllExercisesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        var currentText: String = ""
        if let searchbarText = searchBar.text {
            currentText = searchbarText
        }
        let keyword = (currentText as NSString).replacingCharacters(in: range, with: text)
        search(keyword: keyword)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        search = allExercises
        tabelView.reloadData()
    }
}

extension AllExercisesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let resurl = indexPath.row
        switch resurl {
        case 0:
            return .none
        case 1:
            return .delete
        default:
            return .insert
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none:
            return
        case .delete : print("delete at row \(indexPath.row)")
        case .insert : print("insert at row \(indexPath.row)")
        }
    }
}




