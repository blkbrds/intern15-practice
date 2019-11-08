//
//  BaseViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {}
    
    func loadData() {}
    
    //MARK: -Alert
    func showErrorAlert(with message: String) {
        //self.homeCollectionView.refreshControl?.endRefreshing()
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
