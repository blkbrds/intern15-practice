//
//  CustomCell.swift
//  Baitap09
//
//  Created by PCI0008 on 1/14/20.
//  Copyright © 2020 PCI0008. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class {
    func cell(cell: CustomCell, needPerform action: CustomCell.Action)
}

final class CustomCell: UITableViewCell {
    
    enum Action {
        case showUserName(name: String)
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    weak var delegate: CustomCellDelegate?

    @IBAction private func touchUpInsideTapMeButton(_ sender: Any) {
        delegate?.cell(cell: self, needPerform: CustomCell.Action.showUserName(name: userNameLabel.text ?? ""))
    }
}
