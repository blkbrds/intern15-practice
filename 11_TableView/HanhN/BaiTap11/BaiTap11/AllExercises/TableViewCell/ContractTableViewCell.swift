//
//  ContractTableViewCell.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/26/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class ContractTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contractNameLable: UILabel!
    @IBOutlet weak var subtileLable: UILabel!

    //avatarImageView.layer.cornerRadius = 40
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func updateTableCell(avatar: String, contactName: String = "", subtile: String = "") {
        avatarImageView.image = UIImage(named: "goku")
        contractNameLable.text = contactName
        subtileLable.text = subtile
    }
}
