//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by PCI0019 on 6/30/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func tapButton(_customTabViewCell: CustomTableViewCell)
}
class CustomTableViewCell: UITableViewCell {

    weak var delegate: CustomTableViewCellDelegate?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var subtitleNameLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        delegate?.tapButton(_customTabViewCell: self)
    }
//    func updateTableCell(avatar: String, contactName: String = "", subtitleName: String = "") {
//        avatarImageView.image = UIImage(named: "dowload")
//        contactNameLabel.text = contactName
//        subtitleNameLabel.text = subtitleName
//    }
}
