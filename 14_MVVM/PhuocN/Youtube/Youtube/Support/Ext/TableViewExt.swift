//
//  TableViewExt.swift
//  abc
//
//  Created by PhuocNguyen on 11/5/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

extension UITableView {
    func register(with cell: AnyClass) {
        let className = String(describing: cell)
        register(cell, forCellReuseIdentifier: className)
    }
    
    func register(withNib cell: AnyClass) {
        let className = String(describing: cell)
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(with cell: T.Type) -> T {
        let className = String(describing: cell)
        guard let cell = dequeueReusableCell(withIdentifier: className) as? T else {
            fatalError("Can't load cell")
        }
        return cell
    }
    
    func dequeueReusableCell<T>(with cell: T.Type, indexPath: IndexPath) -> T {
        let className = String(describing: cell)
        guard let cell = dequeueReusableCell(withIdentifier: className, for: indexPath) as? T else {
            fatalError("Can't load cell")
        }
        return cell
    }
    
    func indexFromRow(in section: Int = 0, for row: Int) -> IndexPath {
        return IndexPath(row: row, section: section)
    }
    
    func applyChange(section: Int = 0, insertions: [Int] = [], deletions: [Int] = [], updates: [Int] = []) {
        beginUpdates()
        insertRows(at: insertions.map { indexFromRow(in: section, for: $0) }, with: .bottom)
        deleteRows(at: deletions.map { indexFromRow(in: section, for: $0) }, with: .top)
        reloadRows(at: updates.map { indexFromRow(in: section, for: $0) }, with: .fade)
        endUpdates()
    }
}
