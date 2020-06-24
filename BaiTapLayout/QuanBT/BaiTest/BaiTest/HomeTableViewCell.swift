//
//  HomeTableViewCell.swift
//  BaiTest
//
//  Created by Sếp Quân on 4/29/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet private weak var imageViewCell: UIImageView!
    @IBOutlet private weak var tieuSuLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var diaChiLabel: UILabel!
    @IBOutlet private weak var ngayLabel: UILabel!
    @IBOutlet private weak var gioiTinhLabel: UILabel!
    
    // MARK: - Properties
    var viewModel = HomeCellModel() {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCell.layer.cornerRadius = imageViewCell.bounds.width / 2
        imageViewCell.clipsToBounds = true
        tieuSuLabel.layer.cornerRadius = 10
        tieuSuLabel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - UpdateView
    private func updateView() {
        let data = viewModel.data
        nameLabel.text = data.name
        imageViewCell.image = UIImage(named: data.image)
        tieuSuLabel.text = data.tieusu
        diaChiLabel.text = data.diachi
        ngayLabel.text = data.ngay
        gioiTinhLabel.text = data.gioitinh
    }
}
