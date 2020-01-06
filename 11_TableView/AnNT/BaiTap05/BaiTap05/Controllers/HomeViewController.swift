//
//  HomeViewController.swift
//  BaiTap05
//
//  Created by An Nguyễn on 1/3/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var userTableView: UITableView!
  private var users: [User] = []
  private var searchUsers: [User] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    getData()
    setupUI()
  }
  
  private func setupUI(){
    title = "Home"
  }

  private func getData() {
    users = BundleManager.shared.getUsers()
  }
}

extension HomeViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchUsers)
    if searchText == "" {
      searchUsers = users
    }else {
      let searchLowercased = searchText.lowercased()
      searchUsers = users.filter({ $0.name.lowercased().hasPrefix(searchLowercased) })
    }
    userTableView.reloadData()
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchUsers.isEmpty ? users.count: searchUsers.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let user = searchUsers.isEmpty ? users[indexPath.row]: searchUsers[indexPath.row]
    cell.textLabel?.text = user.name
    return cell
  }
}

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    print(indexPath.row)
  }
}
