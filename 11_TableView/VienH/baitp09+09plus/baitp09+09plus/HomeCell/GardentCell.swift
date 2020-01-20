//
//  GardentCell.swift
//  baitp09+09plus
//
//  Created by user on 12/23/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

protocol GardentCellDelegate: class {
    func cell(customCell: GardentCell, needPerformAction action: GardentCell.Action)
}

final class GardentCell: UITableViewCell {

    // MARK: - Actions
    enum Action {
        case sendTitle(title: String)
    }

    @IBOutlet weak var gardentImageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subTitleLabel: UILabel!

    // MARK: - Closure
    typealias GetGardent = () -> Gardent

    // MARK: - Properties
    weak var delegate: GardentCellDelegate?

    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private funcs
    private func setupUI() {
        gardentImageView.clipsToBounds = true
        gardentImageView.layer.cornerRadius = 40
        gardentImageView.layer.borderWidth = 1
        gardentImageView.layer.borderColor = UIColor.orange.cgColor
    }

    // MARK: - Public funcs
    func updateUI(garden: GetGardent) {
        let gardenVariable = garden()
        gardentImageView.image = UIImage(named: gardenVariable.imageName)
        titleLabel.text = gardenVariable.title
        subTitleLabel.text = gardenVariable.subTitle
    }

    // MARK: - IBAction
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        if let title = titleLabel.text {
            delegate?.cell(customCell: self, needPerformAction: .sendTitle(title: title))
        }
    }
}

