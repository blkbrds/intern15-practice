//
//  NewsFeedViewController.swift
//  BaiTap04
//
//  Created by An Nguyễn on 1/2/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }

  override func viewDidAppear(_ animated: Bool) {
    setupNavigationBar()
  }

  private func setupNavigationBar() {
    title = "News Feed"
      
    navigationController?.navigationBar.setBackgroundImage(UIImage(named: "avatar"), for: .top, barMetrics: .default)
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bag.fill"), style: .plain, target: self, action: nil)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bag.fill"), style: .plain, target: self, action: nil)
  }
}
