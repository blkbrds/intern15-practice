//
//  ContactTableViewCell.swift
//  TableView
//
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
