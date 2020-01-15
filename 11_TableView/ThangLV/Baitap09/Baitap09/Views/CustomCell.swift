//
//  CustomCell.swift
//  Baitap09
//
//  Created by PCI0008 on 1/14/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class {
    func tableviewCell(tableViewCell: CustomCell, needPerform action: CustomCell.Action)
}

class CustomCell: UITableViewCell {
    
    enum Action {
        case showUserName(name: String)
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    weak var delegate: CustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction private func touchUpInsideTapMeButton(_ sender: Any) {
        delegate?.tableviewCell(tableViewCell: self, needPerform: CustomCell.Action.showUserName(name: userNameLabel.text ?? ""))
    }
}
