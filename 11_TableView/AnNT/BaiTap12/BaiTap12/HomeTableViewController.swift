//
//  HomeTableViewController.swift
//  BaiTap12
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

  var arr: [String] = []
  let text = """
  Summary The estimated height of rows in the table view Declaration var estimatedRowHeight: CGFloat { get set } Discussio Providing a nonnegative estimate of the height of rows can improve the performance of loading the table view. If the table contains variable height rows, it might be expensive to calculate all their heights when the table loads. Estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time. The default value is automaticDimension, which means that the table view selects an estimated height to use on your behalf. Setting the value to 0 disables estimated heights, which causes the table view to request the actual height for each cell. If your table uses self-sizing cells, the value of this property must not be 0. When using height estimates, the table view actively manages the contentOffset and contentSize properties inherited from its scroll view. Do not attempt to read or modify those properties directly.
"""

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupData()
  }

  private func setupUI() {
    self.editButtonItem.action = #selector(handleEdit)
    self.navigationItem.rightBarButtonItem = self.editButtonItem
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
    tableView.allowsMultipleSelectionDuringEditing = true
  }

  private func setupData() {
    arr = text.split(separator: " ").map({ String($0) })
  }

  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    cell.textLabel?.text = "\(arr[indexPath.row])"
    return cell
  }

  // MARK: - Table view delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //tableView.deselectRow(at: indexPath, animated: true)
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    let indexs = tableView.indexPathsForSelectedRows
    for index in indexs! {
      print(index.row)
    }
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      arr.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }

  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }

  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    tableView.moveRow(at: fromIndexPath, to: to)
  }

  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  @objc func handleEdit(_ sender: UIBarButtonItem) {
    UIView.animate(withDuration: 0.5) {
      self.tableView.isEditing = !self.tableView.isEditing
      let isEditting = self.tableView.isEditing
      if isEditting {
        sender.title = "Done"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(self.handleDelete))
      } else {
        sender.title = "Edit"
        self.navigationItem.leftBarButtonItem = nil
      }
    }
  }

  @objc func handleDelete() {
    guard let indexs = tableView.indexPathsForSelectedRows else {
      return
    }
    indexs.forEach({ arr.remove(at: $0.row) })
    tableView.deleteRows(at: indexs, with: .fade)
  }

}
