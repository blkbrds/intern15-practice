//
//  ManginalTableViewCell.swift
//  BaiTap11
//
//  Created by ANH NGUYỄN on 11/27/19.
//  Copyright © 2019 asiantech. All rights reserved.
//

import UIKit
protocol ManginalTableViewCellDelegate: class {
    func sendIndex(view: ManginalTableViewCell, needsPerform action: ManginalTableViewCell.Action, index: Int, name: String)
}

class ManginalTableViewCell: UITableViewCell {

    @IBOutlet weak var goKuImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtileLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    enum Action {
        case click(name: String)
    }

    weak var delegate: ManginalTableViewCellDelegate?
    var index: Int = 0
    var name: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        goKuImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func tapMeButton(_ sender: Any) {
        guard let name: String = nameLabel.text else { return }
        delegate?.sendIndex(view: self, needsPerform: .click(name: name), index: index, name: name)
    }

    func updateTabelCell(avatar: String, name: String = "", subtile: String = "") {
        goKuImageView.image = UIImage(named: avatar)
        nameLabel.text = name
        subtileLabel.text = subtile
    }
}


