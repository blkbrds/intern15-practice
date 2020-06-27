//
//  SearchBarNavigationViewController.swift
//  Navigation
//
//  Created by PCI0019 on 6/23/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class SearchBarNavigationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        let searchBar = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchBar
        let cancel = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = cancel
        let imageButton = UIBarButtonItem(image: UIImage(named: "iconn"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [imageButton, cancel]
        let mid1 = UIBarButtonItem(title: "Mid1", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        let mid2 = UIBarButtonItem(title: "Mid2", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [mid1, mid2]
    }
}
