//
//  App.swift
//  FinalProject
//
//  Created by Bien Le Q. on 8/26/19.
//  Copyright © 2019 Asiantech. All rights reserved.
//

import UIKit
import MVVM

class TableView: UITableView, MVVM.View {
    /** Get notified when UITableView has finished asking for data
    http://gg.gg/a5u8h
     */
    func reloadData(moveTop: Bool, completion: (() -> Void)? = nil) {
        if moveTop {
            setContentOffset(CGPoint(x: contentOffset.x, y: 0), animated: false)
            layoutIfNeeded()
        }

        DispatchQueue.main.async { [weak self] in
            guard let this = self else { return }
            this.reloadData()
            this.layoutIfNeeded()
        }

        DispatchQueue.main.async {
            completion?()
        }
    }
}
