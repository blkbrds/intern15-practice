//
//  BaseViewController.swift
//  BaiTap02
//
//  Created by An Nguyễn on 1/1/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupUI()
    setupData()
  }
  
  func setupData(){
    
  }

  func setupUI() {

  }

  func setupNavigationBar() {
    navigationController?.navigationBar.barTintColor = .white
  }
}
