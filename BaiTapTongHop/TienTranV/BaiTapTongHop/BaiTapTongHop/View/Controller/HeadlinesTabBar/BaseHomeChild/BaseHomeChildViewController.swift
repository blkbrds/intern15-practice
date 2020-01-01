//
//  BaseHomeChildViewController.swift
//  BaiTapTongHop
//
//  Created by TranVanTien on 1/1/20.
//  Copyright © 2020 TranVanTien. All rights reserved.
//

import UIKit

final class BaseHomeChildViewController: BaseViewController {

    @IBOutlet private weak var textLabel: UILabel!

    var index: Int? = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        print("first: \(index!)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("second: \(index!)")
    }

    func updateUI(text: String) {
        print("aaa")
    }
}
