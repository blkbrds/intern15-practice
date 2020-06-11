//
//  InfoGitHeader.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/4/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class InfoGitHeader: UITableViewHeaderFooterView {
    
    //MARK: Properties
    @IBOutlet weak var gitLabel: UILabel!

    override func awakeFromNib() {
        contentView.backgroundColor = .lightGray
    }
}
