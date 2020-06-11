//
//  HomeTableViewCell.swift
//  API_MVVM_2
//
//  Created by PCI0002 on 5/28/20.
//  Copyright © 2020 LeThanhLam. All rights reserved.
//

import UIKit

//MARK: Protocol
protocol HomeCellDelegate: class {
    func downloadImage(indexPath: IndexPath)
}

class HomeCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak private var loginLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var thumbnails: UIImageView!

    weak var delegate: HomeCellDelegate?

    var isFavorite: Bool = false

    var indexPath: IndexPath?

    var viewModel: HomeCellModel? {
        didSet {
            updateView()
        }
    }

    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Private Function
    private func updateView() {
        loginLabel.text = viewModel?.login
        nameLabel.text = viewModel?.name
        typeLabel.text = viewModel?.type
        if viewModel?.thumbnailImage == nil {
            if let delegate = delegate {
                delegate.downloadImage(indexPath: indexPath!)
            }
        } else {
            thumbnails.image = viewModel?.thumbnailImage
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
