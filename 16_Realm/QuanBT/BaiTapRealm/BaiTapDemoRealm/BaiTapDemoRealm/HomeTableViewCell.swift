//
//  HomeTableViewCell.swift
//  BaiTapDemoRealm
//
//  Created by Sếp Quân on 4/19/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    // MARK: - updateView
    private func updateView() {
        let data = viewModel.data
        titleLabel.text = data.title
        countLabel.text = String(data.count)
        typeLabel.text = String(data.type)
        let currentDate = data.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss MMMM dd, yyyy"
        dateLabel.text = dateFormatter.string(from: currentDate as Date)
    }
}
