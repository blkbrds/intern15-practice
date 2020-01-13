//
//  InforUser.swift
//  TestCustomView
//
//  Created by PCI0002 on 1/13/20.
//  Copyright © 2020 TranVanTien. All rights reserved.
//

import UIKit

protocol InforUserDelegate: class {
    func customView(_ customview: InforUser, needPerfom action: InforUser.Action)
}

final class InforUser: UIView {
    enum Action {
        case closeView
    }

    var delegate: InforUserDelegate?

    @IBAction func closeButtonTouchUpInside(_ sender: Any) {
        delegate?.customView(self, needPerfom: .closeView)
    }
}
