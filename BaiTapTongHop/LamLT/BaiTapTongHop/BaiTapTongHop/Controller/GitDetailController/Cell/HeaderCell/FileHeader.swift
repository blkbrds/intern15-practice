//
//  FileHeader.swift
//  BaiTapTongHop
//
//  Created by PCI0002 on 6/11/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class FileHeader: UITableViewHeaderFooterView {
    
    //MARK: Properties
    @IBOutlet weak var fileLabel: UILabel!
    
    override func awakeFromNib() {
        contentView.backgroundColor = .lightGray
    }
}
