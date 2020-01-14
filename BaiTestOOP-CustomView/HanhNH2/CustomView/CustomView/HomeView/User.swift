//
//  User.swift
//  CustomView
//
//  Created by ANH NGUYỄN on 1/13/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol UserDelegate: class {
    func customView(_ customview: User, needPerfom action: User.Action)
}

class User: UIView {
    enum Action {
           case closeView
       }

       var delegate: UserDelegate?

       @IBAction func closeButtonTouchUpInside(_ sender: Any) {
           delegate?.customView(self, needPerfom: .closeView)
    }
}
