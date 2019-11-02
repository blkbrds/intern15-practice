//
//  BViewController.swift
//  PracticeTemplate
//
//  Created by ANH NGUYỄN on 11/2/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

final class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        navigationController?.pushViewController(CViewController(), animated: true)
    }
    @IBAction func preButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
