//
//  HomeTableViewCell.swift
//  BaiTapAPIMVVM
//
//  Created by Sếp Quân on 4/24/20.
//  Copyright © 2020 QuanBT. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func tapFavorite(_ homeTableViewCell: HomeTableViewCell)
    
    func addFavoriteToRealm(with object: RealmDatas)
}

final class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var publishedAtLabel: UILabel!
    @IBOutlet weak var titleChannelLabel: UILabel!
    @IBOutlet weak var titleVideoLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Properties
    weak var detegale: HomeTableViewCellDelegate?
    var viewModel = HomeTableViewModel() {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    private func updateView() {
        let dataAPI = viewModel.dataAPI
        titleVideoLabel.text = dataAPI.titleVideo
        titleChannelLabel.text = dataAPI.channelTitle
        publishedAtLabel.text = dataAPI.publishedAt
        if dataAPI.favorite {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    func configImage(image: UIImage?) {
        cellImageView.image = image
    }
    
    @IBAction func favoriteButtonTouchUpInside(_ sender: Any) {
        let dataAPI = viewModel.dataAPI
        if dataAPI.favorite {
            dataAPI.favorite = false
        } else {
            dataAPI.favorite = true
            let realmDatas = RealmDatas()
            realmDatas.idVideo = dataAPI.idVideo
            realmDatas.titleVideo = dataAPI.titleVideo
            realmDatas.channelTitle = dataAPI.channelTitle
            realmDatas.publishedAt = dataAPI.publishedAt
            realmDatas.url = dataAPI.url ?? ""
            detegale?.addFavoriteToRealm(with: realmDatas)
        }
        detegale?.tapFavorite(self)
    }
}
