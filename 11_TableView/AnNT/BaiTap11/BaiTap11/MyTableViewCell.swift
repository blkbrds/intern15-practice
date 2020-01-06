//
//  MyTableViewCell.swift
//  BaiTap11
//
//  Created by An Nguyễn on 1/4/20.
//  Copyright © 2020 An Nguyễn. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
  
  @IBOutlet weak var texttLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
