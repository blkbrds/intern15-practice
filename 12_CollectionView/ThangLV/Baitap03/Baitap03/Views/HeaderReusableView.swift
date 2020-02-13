//
//  HeaderReusableView.swift
//  Baitap03
//
//  Created by PCI0008 on 1/15/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

final class HeaderReusableView: UICollectionReusableView {
    @IBOutlet private weak var sectionLabel: UILabel!
    
    func configData(section: String) {
        sectionLabel.text = section
    }
}
