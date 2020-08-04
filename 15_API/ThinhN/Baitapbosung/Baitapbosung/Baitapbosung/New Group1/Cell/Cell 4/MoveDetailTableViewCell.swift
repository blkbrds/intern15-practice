//
//  MoveDetailTableViewCell.swift
//  Baitapbosung
//
//  Created by ADMIN on 8/4/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class MoveDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var learnLevelLabel: UILabel!
    @IBOutlet weak var learnMethodLabel: UILabel!
    @IBOutlet weak var versionGroupLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
