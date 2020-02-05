//
//  BaseViewController.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupUI() { }

    func setupData() { }
}
extension BaseViewController {
    func alert(title: String, message: String = "") {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: Strings.ok, style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
