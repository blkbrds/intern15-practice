//
//  GardentCell.swift
//  baitp09+09plus
//
//  Created by user on 12/23/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

protocol GardentCellDelegate: class {
    func cell(cell: GardentCell, needPerformAction action: GardentCell.Action)
}

final class GardentCell: UITableViewCell {

    // MARK: - Actions
    enum Action {
        case send(title: String)
    }

    @IBOutlet private weak var gardentImageView: UIImageView!

    @IBOutlet private weak var titleLabel: UILabel!

    @IBOutlet private weak var subTitleLabel: UILabel!

    // MARK: - Closure
    typealias GetGardent = () -> Gardent

    // MARK: - Properties
    weak var delegate: GardentCellDelegate?

    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    // MARK: - Public funcs
    private func configUI() {
        gardentImageView.clipsToBounds = GardenViewController.Config.clipsToBoundsImage
        gardentImageView.layer.cornerRadius = GardenViewController.Config.cornerRadiusImage
        gardentImageView.layer.borderWidth = GardenViewController.Config.borderWidthImage
        gardentImageView.layer.borderColor = GardenViewController.Config.borderColorImage
    }

    func updateUI(garden: GetGardent) {
        let gardenVariable = garden()
        gardentImageView.image = UIImage(named: gardenVariable.imageName)
        titleLabel.text = gardenVariable.title
        subTitleLabel.text = gardenVariable.subTitle
    }

    // MARK: - IBAction
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        if let title = titleLabel.text {
            delegate?.cell(cell: self, needPerformAction: .send(title: title))
        }
    }
}

