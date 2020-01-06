//
//  SearchNavBarViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/2/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class SearchNavBarViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }

  override func viewDidAppear(_ animated: Bool) {
    setupNavigationBar()
  }

  private func setupNavigationBar() {
    let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 100, height: 45))
    searchBar.placeholder = "Search..."
    navigationItem.titleView = searchBar
    searchBar.delegate = self
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))

    let bottomBar = UIView()
    view.addSubview(bottomBar)
    bottomBar.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      bottomBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      bottomBar.widthAnchor.constraint(equalTo: view.widthAnchor),
      bottomBar.heightAnchor.constraint(equalToConstant: 50),
      bottomBar.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      ])
    let segmentControl = UISegmentedControl(items: ["option 1", "option 2"])
    bottomBar.addSubview(segmentControl)
    segmentControl.backgroundColor = .gray
    segmentControl.selectedSegmentTintColor = .red
    segmentControl.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      segmentControl.centerXAnchor.constraint(equalTo: bottomBar.centerXAnchor),
      segmentControl.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor),
      segmentControl.heightAnchor.constraint(equalToConstant: 50),
      segmentControl.leftAnchor.constraint(equalTo: bottomBar.leftAnchor, constant: 20)
      ])
  }

  @objc func handleCancel() {

  }
}

extension SearchNavBarViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)
  }
}
