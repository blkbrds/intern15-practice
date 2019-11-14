//
//  DetailViewController.swift
//  abc
//
//  Created by PhuocNguyen on 10/23/19.
//  Copyright © 2019 PhuocNguyen. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var viewModel: DetailViewModel? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUI() {
        guard let viewModel = viewModel else { return }
        //detailLabel.text = viewModel.namePlace
        print(viewModel.namePlace)
    }
}
