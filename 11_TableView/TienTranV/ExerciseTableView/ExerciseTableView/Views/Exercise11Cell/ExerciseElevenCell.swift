//
//  ExerciseElevenCell.swift
//  ExerciseTableView
//
//  Created by TranVanTien on 12/8/19.
//  Copyright © 2019 TranVanTien. All rights reserved.
//

import UIKit

final class ExerciseElevenCell: UITableViewCell {

    // MARK: - IBOulets
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
