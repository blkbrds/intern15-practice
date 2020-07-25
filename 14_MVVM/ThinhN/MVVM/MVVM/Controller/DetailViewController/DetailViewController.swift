//
//  DetailViewController.swift
//  MVVM
//
//  Created by PCI0019 on 7/7/20.
//  Copyright © 2020 asiantech. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        title = "DETAIL"
    }
    
    func updateView() {
        guard let viewModel = viewModel else { return }
        avatarImageView.image = UIImage(named: viewModel.imageName)
        titleLabel.text = viewModel.title
        addressLabel.text = viewModel.address
        ratingLabel.text = "\(viewModel.rating)/10"
        distanceLabel.text = "\(viewModel.distance)/km"
    }
}
