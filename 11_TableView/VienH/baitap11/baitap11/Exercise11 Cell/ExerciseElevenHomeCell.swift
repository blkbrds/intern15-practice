//
//  ExerciseElevenHomeCell.swift
//  baitap11
//
//  Created by user on 12/24/19.
//  Copyright © 2019 VienH. All rights reserved.
//

import UIKit

final class ExerciseElevenHomeCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var messageLabel: UILabel!

    // MARK: - Closure ~ datasource
    typealias GetMessage = () -> String

    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public funcs
    func updateUI(message: GetMessage) {
        messageLabel.text = message()
    }
}
