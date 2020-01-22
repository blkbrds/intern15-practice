//
//  UITableViewExt.swift
//  BaiTapRealm
//
//  Created by ANH NGUYỄN on 1/22/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register(name: String) {
        let nib = UINib(nibName: name, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: name)
    }
}
