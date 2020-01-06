//
//  SearchBarViewController.swift
//  Baitap04
//
//  Created by Chinh Le on 1/4/20.
//  Copyright © 2020 Thang Le. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = .lightGray
        let leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(touchUpInsideCancelButton))
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc func touchUpInsideCancelButton() {
        
    }
}
