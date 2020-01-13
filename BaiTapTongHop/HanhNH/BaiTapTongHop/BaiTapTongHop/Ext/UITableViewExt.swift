//
//  UITableViewExt.swift
//  BaiTapTongHop
//
//  Created by ANH NGUYỄN on 1/8/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(name: String) {
        let nib = UINib(nibName: name, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: name)
    }
}

extension UICollectionView {
    
    func register(name: String) {
        let nib = UINib(nibName: name, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: name)
    }
}
