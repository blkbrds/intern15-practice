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
    func updateUI(gardent: GetGardent) {
        gardentImageView.image = UIImage(named: gardent().imageName)
        titleLabel.text = gardent().title
        subTitleLabel.text = gardent().subTitle
    }

    // MARK: - IBAction
    @IBAction private func buttonTouchUpInside(_ sender: UIButton) {
        if let title = titleLabel.text {
            delegate?.cell(customCell: self, needPerformAction: .sendTitle(title: title))
        }
    }
}
