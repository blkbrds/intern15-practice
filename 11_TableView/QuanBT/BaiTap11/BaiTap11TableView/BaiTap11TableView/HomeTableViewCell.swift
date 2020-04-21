//
//  HomeTableViewCell.swift
//  BaiTap11TableView
//
//  Created by Sếp Quân on 4/3/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var textDataLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
     // MARK: - updateView
    private func updateView() {
        let data = viewModel.data
        textDataLabel.text = data
       }
}
