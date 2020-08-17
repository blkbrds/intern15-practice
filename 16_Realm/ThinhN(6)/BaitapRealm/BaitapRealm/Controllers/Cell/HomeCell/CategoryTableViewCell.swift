//
//  CategoryTableViewCell.swift
//  BaitapRealm
//
//  Created by ADMIN on 8/16/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit
protocol CategoryTableViewCellDelegate: class {
    func cell(_ cell: CategoryTableViewCell, needPerforms action: CategoryTableViewCell.Action)
}

class CategoryTableViewCell: UITableViewCell {
    
    enum Action {
        case favorite(isFavorite: Bool)
    }
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    weak var delegate: CategoryTableViewCellDelegate?
    var check: Bool = true
    
    var viewModel: CategoryTableViewModel? {
        didSet {
            favoriteButton.isSelected = viewModel!.isFavorite
        }
    }
    
    @IBAction func favoriteButtonTouchUpInside(_ sender: Any) {
        guard let delegate = delegate else {return}
        favoriteButton.isSelected  = !favoriteButton.isSelected
        delegate.cell(self, needPerforms: .favorite(isFavorite: isSelected))
    }
}
