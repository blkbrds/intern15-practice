//
//  ContactCell.swift
//  TableView
//
//  Created by PCI0019 on 7/9/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol ContactCellDelegate: class {
    func tapButton(customTableViewCell: ContactCell)
}

class ContactCell: UITableViewCell {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var contactNameLabel: UILabel!
    @IBOutlet private weak var subtitleNameLabel: UILabel!
    
    weak var delegate: ContactCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
    }

    @IBAction private func tapButtonTouchUpInside(_ sender: Any) {
        delegate?.tapButton(customTableViewCell: self)
    }
}
