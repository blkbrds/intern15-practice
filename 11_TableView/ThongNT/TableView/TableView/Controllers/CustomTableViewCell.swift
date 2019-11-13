//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by PCI0018 on 11/12/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func sendName(view: CustomTableViewCell, needsPerform action: CustomTableViewCell.Tap)
}

final class CustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var customImageView: UIImageView!

    weak var delegate: CustomTableViewCellDelegate?

    enum Tap {
        case userTap (name: String)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateTableCell(name: String, subTitle: String, imageName: String) {
        nameLabel.text = name
        subTitleLabel.text = subTitle
        customImageView.image = UIImage(named: imageName)
    }

    @IBAction private func tapButton(_ sender: Any) {
        guard let name = nameLabel.text else { return }
        delegate?.sendName(view: self, needsPerform: .userTap(name: name))
    }
}
