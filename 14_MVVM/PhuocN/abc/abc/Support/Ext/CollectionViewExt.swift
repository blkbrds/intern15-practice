//
//  TsbleVIewExt.swift
//  DemoAPIYoutube
//
//  Created by PhuocNguyen on 10/30/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit


extension UICollectionView {
    func register(with cell: AnyClass) {
        let className = String(describing: cell)
        register(cell, forCellWithReuseIdentifier: className)
    }
    
    func register(withNib cell: AnyClass) {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(with cell: T.Type, indexPath: IndexPath) -> T {
        let className = String(describing: cell)
        guard let cell = dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T else {
            fatalError("Can't load cell")
        }
        return cell
    }
}
