//
//  DetailViewController.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    func updateView() {
        guard let viewModel = viewModel else { return }
        avatarImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        ratingLabel.text = viewModel.rating
        distanceLabel.text = viewModel.distance
    }
}
