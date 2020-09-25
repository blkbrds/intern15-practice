//
//  HomeTableViewCell.swift
//  BaitapAPI
//
//  Created by ADMIN on 8/11/2563 BE.
//  Copyright © 2563 BE asiantech. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookNameLabel: UILabel!
    
    var viewModel: HomeCellViewModel? {
        didSet {
            updateUI()
        }
    }
    func updateUI() {
        guard let viewModel = viewModel else { return }
        let book = viewModel.book
        bookNameLabel.text = book.name
    }
    func configImage(image: UIImage?) {
        bookImageView.image = image
    }
}
