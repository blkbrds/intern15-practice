//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by PCI0018 on 11/12/19.
//  Copyright © 2019 Asian Tech. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func cell(cell: CustomTableViewCell, needsPerform action: CustomTableViewCell.Action)
}

final class CustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var customImageView: UIImageView!

    weak var delegate: CustomTableViewCellDelegate?

    enum Action {
        case userTap(name: String)
    }

    func updateTableCell(name: String, subTitle: String, imageName: String) {
        nameLabel.text = name
        subTitleLabel.text = subTitle
        customImageView.image = UIImage(named: imageName)
    }

    @IBAction private func tapButtonTouchUpInside(_ sender: Any) {
        guard let name = nameLabel.text else { return }
        delegate?.cell(cell: self, needsPerform: .userTap(name: name))
    }
}
