//
//  DetailViewController.swift
//  BaiTap1API
//
//  Created by PCI0012 on 6/17/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    private func updateView() {
        guard let viewModel = viewModel else {
            return
        }
        avatarImageView.image = viewModel.entry.thumbnailImage
        nameLabel.text = viewModel.entry.labelName
        priceLabel.text = viewModel.entry.labelPrice
        artistLabel.text = viewModel.entry.labelArtist
    }
}
