//
//  DetailViewController.swift
//  BaiTapMVVM
//
//  Created by PCI0012 on 6/2/20.
//  Copyright © 2020 PCI0012. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    
    var detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        avatarImageView.image = UIImage(named: detailViewModel.cafe.avatarName)
        nameTitleLabel.text = detailViewModel.cafe.nameTitle
        addressLabel.text = detailViewModel.cafe.address
        kmLabel.text = detailViewModel.cafe.km
    }
}
