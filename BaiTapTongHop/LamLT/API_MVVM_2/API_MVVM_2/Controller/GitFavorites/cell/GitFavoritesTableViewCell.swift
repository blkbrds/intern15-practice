//
//  GitFavoritesTableViewCell.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 6/9/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

class GitFavoritesTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    var viewModel: GitFavoritesCellModel? {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateView() {
        typeLabel.text = viewModel?.type
        loginLabel.text = viewModel?.login
        urlLabel.text = viewModel?.url
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
