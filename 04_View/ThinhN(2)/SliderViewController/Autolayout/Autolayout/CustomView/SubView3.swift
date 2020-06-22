//
//  SubView3.swift
//  Autolayout
//
//  Created by PCI0019 on 6/16/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit
protocol SubView3Delegate: class {
    func sendDataToViewController(view: SubView3)
}
protocol SubView3Datasource: class {
    func passDataToViewController(view: SubView3) -> String
}

class SubView3: UIView {

    @IBOutlet weak var button: UIButton!

    weak var delegate: SubView3Delegate?
    weak var datasource: SubView3Datasource? {
        didSet {
            setupView()
        }
    }
    @IBAction func buttonTouchUpInsine(_ sender: Any) {
        delegate?.sendDataToViewController(view: self)
    }
    func setupView() {
        guard let person = datasource?.passDataToViewController(view: self) else { return }
        button.setTitle(person, for: .normal)
    }
}
