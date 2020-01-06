//
//  HomeViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
  func logoutDelegate()
}

class HomeViewController: BaseViewController {

  @IBOutlet weak var usernameLabel: UILabel!
  weak var delegate: HomeViewControllerDelegate?
  var user: User?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupUI() {
    usernameLabel.text = user?.username ?? ""
  }

  override func setupNavigationBar() {
    super.setupNavigationBar()
    title = "Home"
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(handleEdit))
  }

  @objc func handleEdit() {
    let editVC = EditViewController()
    editVC.delegate = self
    navigationController?.pushViewController(editVC, animated: true)
  }

  @objc func handleLogout() {
    delegate?.logoutDelegate()
    navigationController?.popViewController(animated: true)
  }
}

extension HomeViewController: EditViewControllerDelegate {
  func passByUser(user: User) {
    self.usernameLabel.text = user.username
  }
}
