//
//  GardentCell.swift
//  ExerciseTableView
//
//  Created by TranVanTien on 12/7/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
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
    
    // MARK: - IBOutlets
    @IBOutlet private weak var gardenImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!

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
        gardenImageView.clipsToBounds = true
        gardenImageView.layer.cornerRadius = 40
        gardenImageView.layer.borderWidth = 1
        gardenImageView.layer.borderColor = UIColor.orange.cgColor
    }

    // MARK: - Public funcs
    func updateUI(garden: GetGardent) {
        let gardenVariable = garden()
        gardenImageView.image = UIImage(named: gardenVariable.imageName)
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
