//
//  BaseViewController.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/6/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    func setupNavigation() { }
}

extension BaseViewController {

    func alert(title: String, message: String = "") {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: Strings.ok, style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
