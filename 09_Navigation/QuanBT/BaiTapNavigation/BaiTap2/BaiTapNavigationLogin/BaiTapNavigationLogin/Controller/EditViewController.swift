//
//  EditViewController.swift
//  BaiTapNavigationLogin
//
//  Created by Sếp Quân on 3/26/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTouchUpInside))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func cancelTouchUpInside(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func doneTouchUpInside(){
        self.navigationController?.popViewController(animated: true)
    }
}
