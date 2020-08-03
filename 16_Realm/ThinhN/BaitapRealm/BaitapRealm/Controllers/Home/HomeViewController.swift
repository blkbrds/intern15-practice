//
//  HomeViewController.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/3/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func configTableView() {
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func setupTabbar() {
        let addNewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewButtonTouchUpInside))
        self.navigationItem.rightBarButtonItem = addNewBarButtonItem
        let deleteNewBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAllButtonTouchUpInside))
        navigationItem.leftBarButtonItem = deleteNewBarButtonItem
    }
    @objc func addNewButtonTouchUpInside() {
        
    }
    @objc func deleteAllButtonTouchUpInside() {
        
    }
    
}
