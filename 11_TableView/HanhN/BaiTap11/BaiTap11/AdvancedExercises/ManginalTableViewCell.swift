//
//  ManginalTableViewCell.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/27/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit

class ManginalTableViewCell: UITableViewCell {

    @IBOutlet weak var goKuImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtileLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        goKuImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func updateTabelCell(avatar: String, name: String = "", subtile: String = "") {
        goKuImageView.image = UIImage(named: avatar)
        nameLabel.text = name
        subtileLabel.text = subtile
    }
}
