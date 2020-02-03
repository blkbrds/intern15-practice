//
//  ForgotPasswordViewController.swift
//  BaiTap01
//
//  Created by An Nguyễn on 1/5/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotPasswordButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
